class Coverage_Collector extends uvm_subscriber #(Seq_Item);
    `uvm_component_utils(Coverage_Collector)

    // Class members
    uvm_analysis_imp #(Seq_Item,Coverage_Collector) Coverage_Collector_port;
    Seq_Item  item;
    uvm_analysis_port #(Seq_Item) monitor_port;

    // Covergroup definition
    covergroup ALU_signals;
        option.per_instance=1;
        reset_case:coverpoint item.Reset;
        carry_input_case:coverpoint item.C_in;
        op_code_case:coverpoint item.op_code {
            bins ADD ={3'b000};
            bins SUB ={3'b001};
            bins MULT ={3'b010};
            bins DIV ={3'b011};
            bins XOR ={3'b101};
        }
        input_A_case: coverpoint item.A {
            bins all_ones={8'b11111111};
            bins all_zeros={8'b0};
            bins random_data=default;
        }
        input_B_case: coverpoint item.B {
            bins all_ones={8'b11111111};
            bins all_zeros={8'b0};
            bins random_data=default;
        }
    endgroup

    // Constructor
    function new(string name ="Coverage_Collector" , uvm_component parent);
        super.new(name,parent);
        `uvm_info(get_type_name(),"inside constructor Monitor class",UVM_LOW)
        Coverage_Collector_port= new("cov_port",this);
        ALU_signals = new();
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info(get_type_name(),"inside build phase of Coverage_Collector class",UVM_LOW)
    endfunction

    // Connect phase
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info(get_type_name(),"inside connect phase of Coverage_Collector class",UVM_LOW)
    endfunction

    // Run phase
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info(get_type_name(),"inside run phase of Coverage_Collector class",UVM_LOW)
    endtask

    // Write function
    function void write(Seq_Item  t);
        item= Seq_Item::type_id::create("item");
        $cast(item,t);
        ALU_signals.sample();
    endfunction
endclass: Coverage_Collector
