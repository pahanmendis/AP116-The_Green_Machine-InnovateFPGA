### OpenCL Implementation of the CNN

This folder contains the source codes that implements the forward propagation of the convolutional neural network on the camera images obtained.<br>
This is implemented using OpenCL SDK for FPGA and deployed on the DE-10 board.<br>

The *common* folder contains the weights obtained from the training of the model in a header file.<br>
The *device* folder contains the kernel file written in OpenCL C for the FPGA fabric.<br>
The *host* folder contains the host program written in C++ that executes the sequencial program of the CNN on the HPS of DE-10 Nano.
