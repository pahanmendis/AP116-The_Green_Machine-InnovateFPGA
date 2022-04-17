module UART_RX(
			input clock,
			input recieve_rx_signal,
			output out_data_valid,
			output out_rx_byte);
			
			parameter clock_count_limit = 217;
			
			parameter idle=3'b000;
			parameter start_bit_detected= 3'b001;
			parameter rx_data_recieve=3'b010;
			parameter stop_bit_detect=3'b011;
			parameter clean=3'b100;
			
			reg [7:0] 	clock_count =0;
			reg [2:0] 	no_of_rx_bytes=0;
			reg[7:0] 	rx_byte=0;
			reg 			data_valid=0;
			reg [2:0] 	state=0;
			
			
			always@(posedge clock)
			begin
			case(state)
				idle:									//identifty a negative edge in rx signal when idle
					begin
						data_valid<=1'b0;
						clock_count<=8'b0;
						no_of_rx_bytes<=3'b0;
						
						if (recieve_rx_signal==1'b0)
							state<=start_bit_detected;
						else
							state<=idle;
					end
				
				start_bit_detected:
					begin
					if (clock_count==(clock_count_limit/2))
						begin
							if(recieve_rx_signal==1'b0)
								begin
								clock_count<=8'b0;
								state<=rx_data_recieve;
								end
							else
								begin
								clock_count<=clock_count+1;
								state<=start_bit_detected;									
								end
						end
					end
				recieve_rx_signal:
					begin
					if(clock_count<clock_count_limit-1)
						begin
							clock_count<=clock_count+1;
							state<=rx_data_recieve;
						end
					
					else
						begin
							clock_count<=0;
							rx_byte[no_of_rx_bytes]<=recieve_rx_signal;
							
							//full byte recieved
							if (no_of_rx_bytes<7)
								begin
									no_of_rx_bytes<=no_of_rx_bytes+1;
									state<=rx_data_recieve;
								end
							else
								begin
									no_of_rx_bytes<=0;
									state<=stop_bit_detect;
								end
						end
					end
				
				stop_bit_detect:
					begin
					if(clock_count<clock_count_limit-1)
						begin
							clock_count<=clock_count+1;
							state<=stop_bit_detect;
						end
					else
						begin
						data_valid<=1;
						clock_count<=0;
						state<=clean;
						end
					
					end
				clean:
					begin
					state<=idle;
					data_valid<=0;
					end
				
				default:
					state<=idle;
				
				endcase
				end
				
				assign out_data_valid=data_valid;
				assign out_rx_byte=rx_byte;
endmodule
				




	