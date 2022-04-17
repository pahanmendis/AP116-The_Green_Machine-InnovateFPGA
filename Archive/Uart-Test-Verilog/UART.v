
module UART(
	input clk,
	input [7:0] tx_byte,
	input data_tx,
	output data_rx,
	input send_data,
	output  [7:0] rx_byte,
	output tx_complete,
	output  rx_data_valid,
	output  active_transmission);
	
	
	
	
	UART_TX transmitter(clk,send_data,tx_byte,active_transmission,data_rx,tx_complete);
	UART_RX reciever(clk,data_tx,rx_data_valid,rx_byte);

endmodule