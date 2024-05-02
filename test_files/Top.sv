// Importing necessary packages
import uvm_pkg::*;

// Including necessary files
`include "Interface.sv"

// Importing necessary packages
import ALU_pkg::*;


// Top module
module Top;
    // Clock signal
    logic clk;

    // Interface instantiation
    ALU_Intf intf(.CLK(clk));

    // DUT instantiation
    DUT ALU_DUT( 
        .CLK(intf.CLK),
        .Reset(intf.Reset),
        .A(intf.A),                          
        .B(intf.B),                 
        .op_code(intf.op_code),
        .C_in(intf.C_in),
        .Result(intf.Result),
        .C_out(intf.C_out),
        .Z_flag(intf.Z_flag)             
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk=~clk;
    end

    // Simulation termination
    initial begin
        #100000
        $finish();
    end

    // UVM test execution
    initial begin
        uvm_config_db #(virtual ALU_Intf)::set(null,"*","intf",intf);
        run_test("Test");
    end
endmodule
