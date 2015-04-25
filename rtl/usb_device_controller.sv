/* USB device controller */

module usb_device_controller
  import types::*;
   (input  wire     reset, // reset
    input  wire     clk,   // system clock (24 MHz)
    input  d_port_t d_i,   // USB port D+,D- (input)
    output d_port_t d_o,   // USB port D+,D- (output)
    output wire     d_en,  // USB port D+,D- (enable)
    if_io.slave     io);   // J1 I/O

   if_transceiver transceiver();

   usb_transceiver usb_transceiver
     (.reset(reset),
      .clk(clk),
      .d_i(d_i),
      .d_o(d_o),
      .d_en(d_en),
      .transceiver(transceiver));

   usb_sie usb_sie
     (.clk(clk),
      .transceiver(transceiver),
      .io(io));
endmodule
