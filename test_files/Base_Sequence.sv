class Base_Sequence extends uvm_sequence #(Seq_Item);
    `uvm_object_utils(Base_Sequence)

    // Constructor
    function  new (string name = "Base_Sequence");
        super.new(name);
    endfunction: new
endclass: Base_Sequence
