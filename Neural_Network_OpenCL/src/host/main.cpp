#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "CL/opencl.h"
#include "AOCLUtils/aocl_utils.h"
#include "gmnet_params.h" // to store the memory addresses of the parameters

using namespace aocl_utils;

// OpenCL runtime configuration
cl_platform_id platform = NULL;
unsigned num_devices = 0;
scoped_array<cl_device_id> device; // num_devices elements
cl_context context = NULL;
cl_command_queue queue;
cl_program program = NULL;

//host buffer
float *h_result_classifier = (float *)malloc((2) * sizeof(float)); 
char class_label[200];

cl_kernel conv11x11, conv9x9, conv5x5, maxpool1, maxpool2, maxpool3, dense1, dense2;

cl_mem d_sample, d_conv1_weight, d_conv1_bias, d_result_conv1, d_result_pool1;
cl_mem d_conv2_weight, d_conv2_bias, d_result_conv2, d_result_pool2;
cl_mem d_conv3_weight, d_conv3_bias, d_result_conv3, d_result_pool3;
cl_mem d_dense1_weight, d_dense1_bias,d_result_dense1;
cl_mem d_dense2_weight, d_dense2_bias,d_result_classifier;

void getLabel(unsigned int class_index);
void cleanup();

// Entry point.
int main() {
  // Initialize OpenCL.
  cl_int status;

  printf("Initializing OpenCL\n");

  if(!setCwdToExeDir()) {
    return 1;
  }

  // Get the OpenCL platform.
  platform = findPlatform("Intel(R) FPGA");
  if(platform == NULL) {
    printf("ERROR: Unable to find Intel(R) FPGA OpenCL platform.\n");
    return 1;
  }

  // Query the available OpenCL device.
  device.reset(getDevices(platform, CL_DEVICE_TYPE_ALL, &num_devices));
  printf("Platform: %s\n", getPlatformName(platform).c_str());
  printf("Using %d device(s)\n", num_devices);
  for(unsigned int i = 0; i < num_devices; ++i) {
    printf("  %s\n", getDeviceName(device[i]).c_str());
  }

  // Create the context.
  context = clCreateContext(NULL, num_devices, device, NULL, NULL, &status);
  checkError(status, "Failed to create context");

  // Create the program for all device. Use the first device as the
  // representative device (assuming all device are of the same type).
  std::string binary_file = getBoardBinaryFile("green_machine", device[0]);
  printf("Using AOCX: %s\n", binary_file.c_str());
  program = createProgramFromBinary(context, binary_file.c_str(), device, num_devices);

  // Build the program that was just created.
  status = clBuildProgram(program, 0, NULL, "", NULL, NULL);
  checkError(status, "Failed to build program");

  queue = clCreateCommandQueue(context, device[0], CL_QUEUE_PROFILING_ENABLE, &status);
  checkError(status, "Failed to create command queue");

  // Kernel.
  const char *kernel1 = "conv2d11x11";
  conv11x11 = clCreateKernel(program, kernel1, &status);
  checkError(status, "Failed to create kernel conv2d11x11");

  const char *kernel2 = "maxpool2d";
  maxpool1 = clCreateKernel(program, kernel2, &status);
  checkError(status, "Failed to create kernel maxpool2d");

  const char *kernel3 = "conv2d9x9";
  conv9x9 = clCreateKernel(program, kernel3, &status);
  checkError(status, "Failed to create kernel conv2d9x9");

  const char *kernel4 = "maxpool2d";
  maxpool2 = clCreateKernel(program, kernel4, &status);
  checkError(status, "Failed to create kernel maxpool2d");

  const char *kernel5 = "conv2d5x5";
  conv5x5 = clCreateKernel(program, kernel5, &status);
  checkError(status, "Failed to create kernel conv2d5x5");

  const char *kernel6 = "maxpool2d";
  maxpool3 = clCreateKernel(program, kernel6, &status);
  checkError(status, "Failed to create kernel maxpool2d");

  const char *kernel7 = "dense";
  dense1 = clCreateKernel(program, kernel7, &status);
  checkError(status, "Failed to create kernel dense1");

  const char *kernel8 = "dense";
  dense2 = clCreateKernel(program, kernel8, &status);
  checkError(status, "Failed to create kernel dense2");
  
  /**************************************************************/
  /*                          conv1                             */
  /**************************************************************/
  //Creat device buffers
  d_sample = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(float) * (1 * 3 * 1600 * 1200), sample, &status);
  checkError(status, "Failed to create buffer d_sample");

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //conv1 params
  d_conv1_weight = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(conv1_weight), conv1_weight, &status);
  checkError(status, "Failed to create buffer d_conv1_weight");
  d_conv1_bias = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(conv1_bias), conv1_bias, &status);
  checkError(status, "Failed to create buffer d_conv1_bias");

  //conv1 result
  d_result_conv1 = clCreateBuffer(context, CL_MEM_WRITE_ONLY, 
                       sizeof(float) * (1 * 8 * 298 * 398), NULL, &status);
  checkError(status, "Failed to create buffer d_result_conv1");
  d_result_pool1 = clCreateBuffer(context, CL_MEM_WRITE_ONLY, 
                       sizeof(float) * (1 * 8 * 149 * 199), NULL, &status);
  checkError(status, "Failed to create buffer d_result_pool1");

  //conv2 params
  d_conv2_weight = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(conv2_weight), conv2_weight, &status);
  checkError(status, "Failed to create buffer d_conv2_weight");
  d_conv2_bias = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(conv2_bias), conv2_bias, &status);
  checkError(status, "Failed to create buffer d_conv2_bias");

  //conv2 result
  d_result_conv2 = clCreateBuffer(context, CL_MEM_WRITE_ONLY, 
                       sizeof(float) * (1 * 16 * 71 * 96), NULL, &status);
  checkError(status, "Failed to create buffer d_result_conv2");
  d_result_pool2 = clCreateBuffer(context, CL_MEM_WRITE_ONLY, 
                       sizeof(float) * (1 * 16 * 35 * 48), NULL, &status);
  checkError(status, "Failed to create buffer d_result_pool2");

  //conv3 params
  d_conv3_weight = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(conv3_weight), conv3_weight, &status);
  checkError(status, "Failed to create buffer d_conv3_weight");
  d_conv3_bias = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(conv3_bias), conv3_bias, &status);
  checkError(status, "Failed to create buffer d_conv3_bias");

  //conv3 result
  d_result_conv3 = clCreateBuffer(context, CL_MEM_WRITE_ONLY, 
                       sizeof(float) * (1 * 16 * 22 * 16), NULL, &status);
  checkError(status, "Failed to create buffer d_result_conv3");
  d_result_pool3 = clCreateBuffer(context, CL_MEM_WRITE_ONLY, 
                       sizeof(float) * (1 * 16 * 11 * 8), NULL, &status);
  checkError(status, "Failed to create buffer d_result_pool3");

  //classifier
  d_dense1_weight = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(dense1_weight), dense1_weight, &status);
  checkError(status, "Failed to create buffer dense1_weight");
  d_dense1_bias = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(dense1_bias), dense1_bias, &status);
  checkError(status, "Failed to create buffer d_classifier_conv_bias");

  d_result_dense1 = clCreateBuffer(context, CL_MEM_WRITE_ONLY, 
                       sizeof(float) * (1 * 128), NULL, &status);
  checkError(status, "Failed to create buffer dense1_bias");

  d_dense2_weight = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(dense2_weight), dense2_weight, &status);
  checkError(status, "Failed to create buffer dense2_weight");
  d_dense2_bias = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(dense2_bias), dense2_bias, &status);
  checkError(status, "Failed to create buffer dense2_bias");

  d_result_classifier = clCreateBuffer(context, CL_MEM_WRITE_ONLY, 
                       sizeof(float) * 2, NULL, &status);
  checkError(status, "Failed to create buffer d_result_classifier");
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  /**************************************************************/
  /*                          conv1                             */
  /**************************************************************/
  printf("\r\nCNN on FPGA start:\r\n");
  double total = 0.0;
  double start_time = getCurrentTimestamp();

  unsigned int input_channel, input_h, input_w, pad_1, stride_1, start_channel, output_h, output_w;
  
  input_channel = 3;
  input_h = 1200;
  input_w = 1600;
  pad_1 = 0; 
  stride_1 = 4; 
  start_channel = 0;
  output_h = 298;
  output_w = 398;

  status |= clSetKernelArg(conv11x11, 0, sizeof(int), &(input_channel));
  status |= clSetKernelArg(conv11x11, 1, sizeof(int), &(input_h));
  status |= clSetKernelArg(conv11x11, 2, sizeof(int), &(input_w));
  status |= clSetKernelArg(conv11x11, 3, sizeof(int), &(pad_1));
  status |= clSetKernelArg(conv11x11, 4, sizeof(int), &(stride_1));
  status |= clSetKernelArg(conv11x11, 5, sizeof(int), &(start_channel));
  status |= clSetKernelArg(conv11x11, 6, sizeof(int), &(output_h));
  status |= clSetKernelArg(conv11x11, 7, sizeof(int), &(output_w));
  status |= clSetKernelArg(conv11x11, 8, sizeof(cl_mem), &d_sample);
  status |= clSetKernelArg(conv11x11, 9, sizeof(cl_mem), &d_conv1_weight);
  status |= clSetKernelArg(conv11x11, 10, sizeof(cl_mem), &d_conv1_bias);
  status |= clSetKernelArg(conv11x11, 11, sizeof(cl_mem), &d_result_conv1);
  checkError(status, "Setting conv1: conv11x11 arguments");

  size_t global_f[2] = {8,298}; 
  status = clEnqueueNDRangeKernel(queue, conv11x11, 2, NULL, global_f, NULL, 0, NULL, NULL);
  checkError(status, "Enqueueing conv1: conv11x11");

  input_h = 298;
  input_w = 398;
  output_h = 149;
  output_h = 199;
  status |= clSetKernelArg(maxpool1, 0, sizeof(int), &(input_h));
  status |= clSetKernelArg(maxpool1, 1, sizeof(int), &(input_w));
  status |= clSetKernelArg(maxpool1, 2, sizeof(int), &(output_h));
  status |= clSetKernelArg(maxpool1, 3, sizeof(int), &(output_w));
  status |= clSetKernelArg(maxpool1, 4, sizeof(cl_mem), &d_result_conv1);
  status |= clSetKernelArg(maxpool1, 5, sizeof(cl_mem), &d_result_pool1);
  checkError(status, "Setting maxpool1 arguments");

  size_t global = 8;
  status = clEnqueueNDRangeKernel(queue, maxpool1, 1, NULL, &global, NULL, 0, NULL, NULL);
  checkError(status, "Enqueueing maxpool1");

  status = clFinish(queue);
  checkError(status, "Wait for maxpool1 finish");

  double end_time = getCurrentTimestamp();
  printf("\r\nconv1 takes: %0.3f ms\r\n", (end_time - start_time) * 1e3);
  total += (end_time - start_time);
  start_time = end_time;
  
  /**************************************************************/
  /*                          conv2                             */
  /**************************************************************/
  double total = 0.0;
  double start_time = getCurrentTimestamp();

  unsigned int input_channel, input_h, input_w, pad_2, stride_2, start_channel, output_h, output_w;
  
  input_channel = 3;
  input_h = 149;
  input_w = 199;
  pad_2 = 0; 
  stride_2 = 2; 
  start_channel = 0;
  output_h = 71;
  output_w = 96;

  status |= clSetKernelArg(conv9x9, 0, sizeof(int), &(input_channel));
  status |= clSetKernelArg(conv9x9, 1, sizeof(int), &(input_h));
  status |= clSetKernelArg(conv9x9, 2, sizeof(int), &(input_w));
  status |= clSetKernelArg(conv9x9, 3, sizeof(int), &(pad_2));
  status |= clSetKernelArg(conv9x9, 4, sizeof(int), &(stride_2));
  status |= clSetKernelArg(conv9x9, 5, sizeof(int), &(start_channel));
  status |= clSetKernelArg(conv9x9, 6, sizeof(int), &(output_h));
  status |= clSetKernelArg(conv9x9, 7, sizeof(int), &(output_w));
  status |= clSetKernelArg(conv9x9, 8, sizeof(cl_mem), &d_result_pool1);
  status |= clSetKernelArg(conv9x9, 9, sizeof(cl_mem), &d_conv2_weight);
  status |= clSetKernelArg(conv9x9, 10, sizeof(cl_mem), &d_conv2_bias);
  status |= clSetKernelArg(conv9x9, 11, sizeof(cl_mem), &d_result_conv2);
  checkError(status, "Setting conv2: conv9x9 arguments");

  size_t global_f[2] = {16,71}; 
  status = clEnqueueNDRangeKernel(queue, conv9x9, 2, NULL, global_f, NULL, 0, NULL, NULL);
  checkError(status, "Enqueueing conv2: conv9x9");

  input_h = 71;
  input_w = 96;
  output_h = 35;
  output_w = 48;
  status |= clSetKernelArg(maxpool2, 0, sizeof(int), &(input_h));
  status |= clSetKernelArg(maxpool2, 1, sizeof(int), &(input_h));
  status |= clSetKernelArg(maxpool2, 2, sizeof(int), &(output_h));
  status |= clSetKernelArg(maxpool2, 3, sizeof(int), &(output_w));
  status |= clSetKernelArg(maxpool2, 4, sizeof(cl_mem), &d_result_conv2);
  status |= clSetKernelArg(maxpool2, 5, sizeof(cl_mem), &d_result_pool2);
  checkError(status, "Setting maxpool2 arguments");

  size_t global = 16;
  status = clEnqueueNDRangeKernel(queue, maxpool2, 1, NULL, &global, NULL, 0, NULL, NULL);
  checkError(status, "Enqueueing maxpool2");

  status = clFinish(queue);
  checkError(status, "Wait for maxpool1 finish");

  double end_time = getCurrentTimestamp();
  printf("\r\nconv1 takes: %0.3f ms\r\n", (end_time - start_time) * 1e3);
  total += (end_time - start_time);
  start_time = end_time;
  
  /**************************************************************/
  /*                          conv3                             */
  /**************************************************************/
  double total = 0.0;
  double start_time = getCurrentTimestamp();

  unsigned int input_channel, input_h, input_w, pad_3, stride_3, start_channel, output_h, output_w;
  
  input_channel = 3;
  input_h = 35;
  input_w = 96;
  pad_3 = 0; //////////////////////////////////////////////////////////////////////////////
  stride_3 = 4; ///////////////////////////////////////////////////////////////////////////
  start_channel = 0;
  output_h = 16;
  output_w = 22;

  status |= clSetKernelArg(conv5x5, 0, sizeof(int), &(input_channel));
  status |= clSetKernelArg(conv5x5, 1, sizeof(int), &(input_h));
  status |= clSetKernelArg(conv5x5, 2, sizeof(int), &(input_w));
  status |= clSetKernelArg(conv5x5, 3, sizeof(int), &(pad_3));
  status |= clSetKernelArg(conv5x5, 4, sizeof(int), &(stride_3));
  status |= clSetKernelArg(conv5x5, 5, sizeof(int), &(start_channel));
  status |= clSetKernelArg(conv5x5, 6, sizeof(int), &(output_h));
  status |= clSetKernelArg(conv5x5, 7, sizeof(int), &(output_w));
  status |= clSetKernelArg(conv5x5, 8, sizeof(cl_mem), &d_result_pool2);
  status |= clSetKernelArg(conv5x5, 9, sizeof(cl_mem), &d_conv3_weight);
  status |= clSetKernelArg(conv5x5, 10, sizeof(cl_mem), &d_conv3_bias);
  status |= clSetKernelArg(conv5x5, 11, sizeof(cl_mem), &d_result_conv3);
  checkError(status, "Setting conv3: conv5x5 arguments");

  size_t global_f[2] = {16,16}; //////////////////////////////////////////////////////////////////////////
  status = clEnqueueNDRangeKernel(queue, conv5x5, 2, NULL, global_f, NULL, 0, NULL, NULL);
  checkError(status, "Enqueueing conv3: conv5x5");

  input_h = 16;
  input_w = 22;
  output_h = 8;
  output_w = 11;
  status |= clSetKernelArg(maxpool3, 0, sizeof(int), &(input_h));
  status |= clSetKernelArg(maxpool3, 1, sizeof(int), &(input_w));
  status |= clSetKernelArg(maxpool3, 2, sizeof(int), &(output_h));
  status |= clSetKernelArg(maxpool3, 3, sizeof(int), &(output_w));
  status |= clSetKernelArg(maxpool3, 4, sizeof(cl_mem), &d_result_conv3);
  status |= clSetKernelArg(maxpool3, 5, sizeof(cl_mem), &d_result_pool3);
  checkError(status, "Setting maxpool3 arguments");

  size_t global = 16;
  status = clEnqueueNDRangeKernel(queue, maxpool3, 1, NULL, &global, NULL, 0, NULL, NULL);
  checkError(status, "Enqueueing maxpool3");

  status = clFinish(queue);
  checkError(status, "Wait for maxpool1 finish");

  double end_time = getCurrentTimestamp();
  printf("\r\nconv1 takes: %0.3f ms\r\n", (end_time - start_time) * 1e3);
  total += (end_time - start_time);
  start_time = end_time;
  
  /**************************************************************/
  /*                       classifier                           */
  /**************************************************************/
  unsigned int input_size, output_size;
  input_size = 1408;
  output_size = 128;

  status |= clSetKernelArg(dense1, 0, sizeof(int), &(input_size));
  status |= clSetKernelArg(dense1, 1, sizeof(int), &(input_size));
  status |= clSetKernelArg(dense1, 2, sizeof(cl_mem), &d_result_pool3);
  status |= clSetKernelArg(dense1, 3, sizeof(cl_mem), &d_dense1_weight);
  status |= clSetKernelArg(dense1, 4, sizeof(cl_mem), &d_dense1_bias);
  status |= clSetKernelArg(dense1, 5, sizeof(cl_mem), &d_result_dense1;
  checkError(status, "Setting dense1 arguments");

  global_f[] = {1408};
  status = clEnqueueNDRangeKernel(queue, dense1, 2, NULL, global_f, NULL, 0, NULL, NULL);
  checkError(status, "Enqueueing dense1");

  input_size = 128;
  output_size = 2;

  status |= clSetKernelArg(dense1, 0, sizeof(int), &(input_size));
  status |= clSetKernelArg(dense1, 1, sizeof(int), &(input_size));
  status |= clSetKernelArg(dense1, 2, sizeof(cl_mem), &d_result_dense1);
  status |= clSetKernelArg(dense1, 3, sizeof(cl_mem), &d_dense2_weight);
  status |= clSetKernelArg(dense1, 4, sizeof(cl_mem), &d_dense2_bias);
  status |= clSetKernelArg(dense1, 5, sizeof(cl_mem), &d_result_classifier);
  checkError(status, "Setting dense2 arguments");

  global_f[] = {2};
  status = clEnqueueNDRangeKernel(queue, dense2, 2, NULL, global_f, NULL, 0, NULL, NULL);
  checkError(status, "Enqueueing dense2");

  status = clFinish(queue);
  checkError(status, "Wait for classifier finish");
  end_time = getCurrentTimestamp();
  status = clEnqueueReadBuffer(queue, d_result_classifier, CL_TRUE, 0, sizeof(float) * 2, h_result_classifier, 0, NULL, NULL );

  float tmp = 0.0f;
  unsigned int class_index = 0;
  for(int j = 0; j < 2; j++)
  {
    if(h_result_classifier[j] > tmp)
    {
  	  tmp = h_result_classifier[j];
      class_index = j;
    }
  }
  printf("classifier takes: %0.3f ms\r\n", (end_time - start_time) * 1e3);
  total += (end_time - start_time);
  printf("total: %0.3f ms\r\n", total * 1e3);
  getLabel(class_index);
  printf("\r\npredicted label: %s\r\n", class_label);

  cleanup();

  printf("done\n");

  return 0;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}

void getLabel(unsigned int class_index)
{
  int i;
  
  FILE *fp;

  fp = fopen("labeled_photos", "r");
  for(i = 0; i < class_index + 1; i++)
  {
    fgets(class_label, sizeof(class_label), fp);
  }
  fclose(fp);
}

void cleanup()
{
  clReleaseMemObject(d_sample);
  clReleaseMemObject(d_conv1_weight);
  clReleaseMemObject(d_conv1_bias);
  clReleaseMemObject(d_result_conv1);
  clReleaseMemObject(d_result_pool1);

  clReleaseMemObject(d_conv2_weight);
  clReleaseMemObject(d_conv2_bias);
  clReleaseMemObject(d_result_conv2);
  clReleaseMemObject(d_result_pool2);

  clReleaseMemObject(d_conv3_weight);
  clReleaseMemObject(d_conv3_bias);
  clReleaseMemObject(d_result_conv3);
  clReleaseMemObject(d_result_pool3);

  clReleaseMemObject(d_dense1_weight);
  clReleaseMemObject(d_dense1_bias);
  clReleaseMemObject(d_result_dense1);

  clReleaseMemObject(d_dense2_weight);
  clReleaseMemObject(d_dense2_bias);
  clReleaseMemObject(d_result_classifier);

  clReleaseKernel(conv11x11);
  clReleaseKernel(conv9x9);
  clReleaseKernel(conv5x5);
  clReleaseKernel(maxpool1);
  clReleaseKernel(maxpool2);
  clReleaseKernel(maxpool3);
  clReleaseKernel(dense1);
  clReleaseKernel(dense2);
	
  clReleaseCommandQueue(queue);
  clReleaseCommandQueue(queue);
  clReleaseProgram(program);
  clReleaseContext(context);

  free(h_result_classifier);
}

