

module UART_TX(
	input clk,
	input in_tx_data_valid,
	input [7:0] in_tx_byte,
	output out_tx_active,
	output reg out_serial_pin,
	output out_tx_complete);
	
	parameter clock_count_limit=217;
	
	parameter idle=3'd0;
	parameter tx_start_bit=3'd1;
	parameter tx_data_transmission=3'd2;
	parameter tx_stop_bit=3'd3;
	parameter clean=3'd4;
	
	reg [2:0] state=0;
	reg [7:0] clock_count=0;
	reg [2:0] tx_bit_count=0;
	reg [7:0] tx_byte=0;
	reg tx_complete=0;
	reg tx_active=0;
	
	always@(posedge clk)
	begin
		case(state)
		
		idle:
			begin
				out_serial_pin<=1'b1;
				tx_complete <=1'b0;
				clock_count<=0;
				tx_bit_count<=0;
				
				if(in_tx_data_valid==1'b1)
					begin
						tx_active<=1'b1;
						tx_byte<=in_tx_byte;
						state<=tx_start_bit;
					end
				
				else
					state<=idle;
					
		
			end
		tx_start_bit:
			begin
				out_serial_pin<=1'b0;
				if (clock_count < clock_count_limit-1)
					begin
						clock_count=clock_count+1;
						state<=tx_start_bit;
					end
				else
					begin
						clock_count<=0;
						state<=tx_data_transmission;
					end
			end
			
		tx_data_transmission:
			begin
				out_serial_pin<=tx_byte[tx_bit_count];
				
				if (clock_count < clock_count_limit-1)
					begin
						clock_count<=clock_count+1;
						state<=tx_data_transmission;
					end
				
				else
					begin
						clock_count<=0;
						
						if(tx_bit_count<7)
							begin
								tx_bit_count<=tx_bit_count+1;
								state<=tx_data_transmission;
							end
						else
							begin
								tx_bit_count<=0;
								state<=tx_stop_bit;
					
							end
					end
			end
	
		tx_stop_bit:
			begin
				out_serial_pin<=1'b1;
				
				if(clock_count<=clock_count_limit-1)
					begin
						clock_count<=clock_count+1;
						state<=tx_stop_bit;
					end
				else
					begin
						tx_complete<=1'b1;
						clock_count<=0;
						state<=clean;
						tx_active<=1'b0;
					end
			end
			
		clean:
			begin
				tx_complete<=1'b1;
				state<=idle;
			end
		
		default:
			state<=idle;
		endcase
	end
	
	assign out_tx_active=tx_active;
	assign out_tx_complete=tx_complete;

endmodule
				
				
							
							
							
							