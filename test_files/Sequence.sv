// Base_Sequence class extending from uvm_sequence
class Base_Sequence extends uvm_sequence #(Seq_Item);
    `uvm_object_utils(Base_Sequence)

    // Constructor
    function new (string name= "Base_Sequence");
        super.new(name);
        `uvm_info(get_type_name()," Inside constructor of Base_Sequence ",UVM_HIGH)
    endfunction: new
endclass: Base_Sequence

// Reset_Sequence class extending from Base_Sequence
class Reset_Sequence extends Base_Sequence;
    `uvm_object_utils(Reset_Sequence)

    // Class member
    Seq_Item item;

    // Constructor
    function new (string name= "Reset_Sequence");
        super.new(name);
        `uvm_info(get_type_name() ," Inside constructor of Reset_Sequence ",UVM_HIGH)
    endfunction: new

    // Body task
    task body();
        item = Seq_Item ::type_id::create("item");
        start_item(item);
        if(!(item.randomize() with {Reset==1;}))
            `uvm_error(" Reset_Sequence "," the randomization failed ")
        finish_item(item);
    endtask: body
endclass: Reset_Sequence 

// Test_Sequence class extending from Base_Sequence
class Test_Sequence extends Base_Sequence;
    `uvm_object_utils(Test_Sequence)

    // Class member
    Seq_Item item;

    // Constructor
    function new (string name= "Test_Sequence");
        super.new(name);
        `uvm_info(get_type_name() ," Inside constructor of Test_Sequence ",UVM_HIGH)
    endfunction: new

    // Body task
    task body();
        item = Seq_Item ::type_id::create("item");
        start_item(item);
        if(!(item.randomize() with {Reset==0;}))
            `uvm_error(" Test_Sequence "," the randomization failed ")
        finish_item(item);
    endtask: body 
endclass: Test_Sequence
