// Sequencer class extending from uvm_sequencer
class Sequencer extends uvm_sequencer #(Seq_Item);
    `uvm_component_utils(Sequencer)

    // Constructor
    function new(string name = "Sequencer" , uvm_component  parent);
        super.new(name , parent);
        `uvm_info(get_type_name(),"inside constructor Sequencer class",UVM_LOW)
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info(get_type_name(),"inside build_phase of Sequencer class",UVM_LOW)
    endfunction

    // Connect phase
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info(get_type_name(),"inside connect_phase of Sequencer class",UVM_LOW)
    endfunction

    // Run phase
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info(get_type_name(),"inside run_phase of Sequencer class",UVM_LOW)
    endtask
endclass: Sequencer
