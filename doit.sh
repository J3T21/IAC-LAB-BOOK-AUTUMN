rm -rf obj_dir


#run Verilator to translate Verilog into C++ including testbench
verilator -Wall --cc --trace sinegen.sv --exe sinegen_tb.cpp

# build c++ project via make

make -j -C obj_dir/ -f Vsinegen.mk Vsinegen

# run exe
obj_dir/Vsinegen