// Scoreboard class extending from uvm_scoreboard
class Scoreboard extends uvm_scoreboard;
    `uvm_component_utils(Scoreboard)

    // Class members
    uvm_analysis_imp#(Seq_Item ,Scoreboard) SB_port;
    Seq_Item items_Q[$];
    Seq_Item item_t;

    // Constructor
    function new(string name = "Scoreboard" , uvm_component parent);
        super.new(name , parent);
        `uvm_info(get_type_name(),"inside constructor Scoreboard class",UVM_LOW)
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info(get_type_name(),"inside build_phase of Scoreboard class",UVM_LOW)
        SB_port = new("SB_port ",this);
    endfunction

    // Run phase
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info(get_type_name(),"inside run_phase of Scoreboard class",UVM_LOW)
        forever begin
            item_t = Seq_Item::type_id::create("item");
            wait(items_Q.size);
            item_t =  items_Q.pop_front();
            compare(item_t);
        end
    endtask 

    // Write function
    function void write(Seq_Item item);
        items_Q.push_back(item);
    endfunction  

    // Compare function
    function void compare(Seq_Item item_i);
        logic[16:0] Result_t;
        logic C_out_t, Z_flag_t;

        // Compute result based on op_code
        // ...

        // Check flags
        // ...

        // Compare results
        if(!(Result_t==item_i.Result && item_i.Z_flag==Z_flag_t && item_i.Z_flag==Z_flag_t))
            `uvm_error(get_type_name(), $sformatf("failure!! the actual result= %d while the expected reuslt= %d",item_i.Result,Result_t))  
    endfunction
endclass: Scoreboard
