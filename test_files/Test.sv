// Test class extending from uvm_test
class Test extends uvm_test;
    `uvm_component_utils(Test)

    // Class members
    Environment Test_environment;
    Reset_Sequence Reset_seq;
    Test_Sequence Test_seq;

    // Constructor
    function new (string name= "Test", uvm_component parent);
        super.new(name,parent);
        `uvm_info(get_type_name() ," Inside constructor of Test class ",UVM_LOW);
    endfunction: new

    // Build phase
    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        `uvm_info(get_type_name() ," Inside build phase of Test class ",UVM_LOW);
        Test_environment= Environment::type_id::create("Test_environment",this);
    endfunction: build_phase

    // Run phase
    task run_phase (uvm_phase phase );
        super.run_phase(phase);
        `uvm_info(get_type_name() ," Inside run phase of Test class ",UVM_LOW);
        phase.raise_objection(this);

        // Start reset sequence
        Reset_seq = Reset_Sequence::type_id::create("Reset_seq");
        Reset_seq.start(Test_environment.agent.sequencer);
        #10;

        // Start test sequence
        repeat(900) begin 
            Test_seq = Test_Sequence::type_id::create("Test_seq");
            Test_seq.start(Test_environment.agent.sequencer);
            #10;
        end

        phase.drop_objection(this);
    endtask: run_phase
endclass: Test
