-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 19.1 (Release Build #670)
-- 
-- Legal Notice: Copyright 2019 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from dense_function_wrapper
-- VHDL created on Tue Jun 28 19:34:36 2022


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity dense_function_wrapper is
    port (
        avm_unnamed_dense0_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_dense0_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense0_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense0_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense1_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_dense1_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense1_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense1_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense3_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_dense3_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense3_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense3_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense4_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_dense4_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense4_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense4_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense5_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_dense5_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense5_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense5_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        clock2x : in std_logic_vector(0 downto 0);  -- ufix1
        global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_2 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        kernel_arguments : in std_logic_vector(319 downto 0);  -- ufix320
        kernel_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        local_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        local_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        local_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        local_router_hang : in std_logic_vector(0 downto 0);  -- ufix1
        local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_0 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_1 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_2 : in std_logic_vector(31 downto 0);  -- ufix32
        stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        start : in std_logic_vector(0 downto 0);  -- ufix1
        valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        work_dim : in std_logic_vector(31 downto 0);  -- ufix32
        workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_dense0_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_unnamed_dense0_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_dense0_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_dense0_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense0_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense0_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense0_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_dense1_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_unnamed_dense1_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_dense1_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_dense1_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense1_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense1_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense1_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_dense3_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_unnamed_dense3_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_dense3_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_dense3_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense3_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense3_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense3_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_dense4_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_unnamed_dense4_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_dense4_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_dense4_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense4_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense4_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense4_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_dense5_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_unnamed_dense5_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_dense5_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_dense5_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense5_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense5_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_dense5_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        clock2x_output : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_lsu_active : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_write_pending : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end dense_function_wrapper;

architecture normal of dense_function_wrapper is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_clock2x_holder is
        port (
            clock2x : in std_logic;
            myout : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component dense_function is
        port (
            in_arg_filter_bias : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense1_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense1_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense3_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense3_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense4_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense4_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense4_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense4_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense5_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_active_unnamed_dense1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_active_unnamed_dense5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_dense0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_dense0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_dense0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_unnamed_dense1_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_dense1_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_dense1_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_dense1_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense1_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense1_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense1_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_unnamed_dense3_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_dense3_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_dense3_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_dense3_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense3_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense3_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense3_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_unnamed_dense4_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_dense4_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_dense4_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_dense4_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense4_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense4_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense4_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_2_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_3_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_4_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x_bitsignaltemp : std_logic;
    signal acl_clock2x_dummy_consumer_myout : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_myout_bitsignaltemp : std_logic;
    signal arg_filter_bias_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_filter_weight_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_input_im_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_input_size_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_output_im_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_output_size_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_function_out_o_active_unnamed_dense1 : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_function_out_o_active_unnamed_dense5 : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_function_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_function_out_unnamed_dense0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal dense_function_out_unnamed_dense0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal dense_function_out_unnamed_dense0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_function_out_unnamed_dense0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_function_out_unnamed_dense0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_function_out_unnamed_dense0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_function_out_unnamed_dense0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal dense_function_out_unnamed_dense1_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal dense_function_out_unnamed_dense1_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal dense_function_out_unnamed_dense1_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_function_out_unnamed_dense1_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_function_out_unnamed_dense1_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_function_out_unnamed_dense1_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_function_out_unnamed_dense1_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal dense_function_out_unnamed_dense3_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal dense_function_out_unnamed_dense3_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal dense_function_out_unnamed_dense3_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_function_out_unnamed_dense3_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_function_out_unnamed_dense3_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_function_out_unnamed_dense3_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_function_out_unnamed_dense3_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal dense_function_out_unnamed_dense4_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal dense_function_out_unnamed_dense4_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal dense_function_out_unnamed_dense4_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_function_out_unnamed_dense4_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_function_out_unnamed_dense4_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_function_out_unnamed_dense4_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_function_out_unnamed_dense4_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal dense_function_out_unnamed_dense5_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal dense_function_out_unnamed_dense5_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal dense_function_out_unnamed_dense5_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_function_out_unnamed_dense5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_function_out_unnamed_dense5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_function_out_unnamed_dense5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_function_out_unnamed_dense5_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal dense_function_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (31 downto 0);
    signal is_any_lsu_active_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- arg_output_size_select(BITSELECT,13)
    arg_output_size_select_b <= kernel_arguments(63 downto 32);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,2)
    dupName_0_ip_dsdk_adapt_cast_x_b <= arg_output_size_select_b(31 downto 0);

    -- arg_output_im_select(BITSELECT,12)
    arg_output_im_select_b <= kernel_arguments(319 downto 256);

    -- dupName_4_ip_dsdk_adapt_cast_x(BITSELECT,6)
    dupName_4_ip_dsdk_adapt_cast_x_b <= arg_output_im_select_b(63 downto 0);

    -- arg_input_size_select(BITSELECT,11)
    arg_input_size_select_b <= kernel_arguments(31 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,67)
    ip_dsdk_adapt_cast_b <= arg_input_size_select_b(31 downto 0);

    -- arg_input_im_select(BITSELECT,10)
    arg_input_im_select_b <= kernel_arguments(127 downto 64);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,3)
    dupName_1_ip_dsdk_adapt_cast_x_b <= arg_input_im_select_b(63 downto 0);

    -- arg_filter_weight_select(BITSELECT,9)
    arg_filter_weight_select_b <= kernel_arguments(191 downto 128);

    -- dupName_2_ip_dsdk_adapt_cast_x(BITSELECT,4)
    dupName_2_ip_dsdk_adapt_cast_x_b <= arg_filter_weight_select_b(63 downto 0);

    -- arg_filter_bias_select(BITSELECT,8)
    arg_filter_bias_select_b <= kernel_arguments(255 downto 192);

    -- dupName_3_ip_dsdk_adapt_cast_x(BITSELECT,5)
    dupName_3_ip_dsdk_adapt_cast_x_b <= arg_filter_bias_select_b(63 downto 0);

    -- dense_function(BLACKBOX,15)
    thedense_function : dense_function
    PORT MAP (
        in_arg_filter_bias => dupName_3_ip_dsdk_adapt_cast_x_b,
        in_arg_filter_weight => dupName_2_ip_dsdk_adapt_cast_x_b,
        in_arg_global_id_0 => global_id_0,
        in_arg_global_size_0 => global_size_0,
        in_arg_global_size_1 => global_size_1,
        in_arg_global_size_2 => global_size_2,
        in_arg_input_im => dupName_1_ip_dsdk_adapt_cast_x_b,
        in_arg_input_size => ip_dsdk_adapt_cast_b,
        in_arg_local_size_0 => local_size_0,
        in_arg_local_size_1 => local_size_1,
        in_arg_local_size_2 => local_size_2,
        in_arg_output_im => dupName_4_ip_dsdk_adapt_cast_x_b,
        in_arg_output_size => dupName_0_ip_dsdk_adapt_cast_x_b,
        in_stall_in => GND_q,
        in_start => start,
        in_unnamed_dense0_avm_readdata => avm_unnamed_dense0_readdata,
        in_unnamed_dense0_avm_readdatavalid => avm_unnamed_dense0_readdatavalid,
        in_unnamed_dense0_avm_waitrequest => avm_unnamed_dense0_waitrequest,
        in_unnamed_dense0_avm_writeack => avm_unnamed_dense0_writeack,
        in_unnamed_dense1_avm_readdata => avm_unnamed_dense1_readdata,
        in_unnamed_dense1_avm_readdatavalid => avm_unnamed_dense1_readdatavalid,
        in_unnamed_dense1_avm_waitrequest => avm_unnamed_dense1_waitrequest,
        in_unnamed_dense1_avm_writeack => avm_unnamed_dense1_writeack,
        in_unnamed_dense3_avm_readdata => avm_unnamed_dense3_readdata,
        in_unnamed_dense3_avm_readdatavalid => avm_unnamed_dense3_readdatavalid,
        in_unnamed_dense3_avm_waitrequest => avm_unnamed_dense3_waitrequest,
        in_unnamed_dense3_avm_writeack => avm_unnamed_dense3_writeack,
        in_unnamed_dense4_avm_readdata => avm_unnamed_dense4_readdata,
        in_unnamed_dense4_avm_readdatavalid => avm_unnamed_dense4_readdatavalid,
        in_unnamed_dense4_avm_waitrequest => avm_unnamed_dense4_waitrequest,
        in_unnamed_dense4_avm_writeack => avm_unnamed_dense4_writeack,
        in_unnamed_dense5_avm_readdata => avm_unnamed_dense5_readdata,
        in_unnamed_dense5_avm_readdatavalid => avm_unnamed_dense5_readdatavalid,
        in_unnamed_dense5_avm_waitrequest => avm_unnamed_dense5_waitrequest,
        in_unnamed_dense5_avm_writeack => avm_unnamed_dense5_writeack,
        in_valid_in => kernel_valid_in,
        out_o_active_unnamed_dense1 => dense_function_out_o_active_unnamed_dense1,
        out_o_active_unnamed_dense5 => dense_function_out_o_active_unnamed_dense5,
        out_stall_out => dense_function_out_stall_out,
        out_unnamed_dense0_avm_address => dense_function_out_unnamed_dense0_avm_address,
        out_unnamed_dense0_avm_burstcount => dense_function_out_unnamed_dense0_avm_burstcount,
        out_unnamed_dense0_avm_byteenable => dense_function_out_unnamed_dense0_avm_byteenable,
        out_unnamed_dense0_avm_enable => dense_function_out_unnamed_dense0_avm_enable,
        out_unnamed_dense0_avm_read => dense_function_out_unnamed_dense0_avm_read,
        out_unnamed_dense0_avm_write => dense_function_out_unnamed_dense0_avm_write,
        out_unnamed_dense0_avm_writedata => dense_function_out_unnamed_dense0_avm_writedata,
        out_unnamed_dense1_avm_address => dense_function_out_unnamed_dense1_avm_address,
        out_unnamed_dense1_avm_burstcount => dense_function_out_unnamed_dense1_avm_burstcount,
        out_unnamed_dense1_avm_byteenable => dense_function_out_unnamed_dense1_avm_byteenable,
        out_unnamed_dense1_avm_enable => dense_function_out_unnamed_dense1_avm_enable,
        out_unnamed_dense1_avm_read => dense_function_out_unnamed_dense1_avm_read,
        out_unnamed_dense1_avm_write => dense_function_out_unnamed_dense1_avm_write,
        out_unnamed_dense1_avm_writedata => dense_function_out_unnamed_dense1_avm_writedata,
        out_unnamed_dense3_avm_address => dense_function_out_unnamed_dense3_avm_address,
        out_unnamed_dense3_avm_burstcount => dense_function_out_unnamed_dense3_avm_burstcount,
        out_unnamed_dense3_avm_byteenable => dense_function_out_unnamed_dense3_avm_byteenable,
        out_unnamed_dense3_avm_enable => dense_function_out_unnamed_dense3_avm_enable,
        out_unnamed_dense3_avm_read => dense_function_out_unnamed_dense3_avm_read,
        out_unnamed_dense3_avm_write => dense_function_out_unnamed_dense3_avm_write,
        out_unnamed_dense3_avm_writedata => dense_function_out_unnamed_dense3_avm_writedata,
        out_unnamed_dense4_avm_address => dense_function_out_unnamed_dense4_avm_address,
        out_unnamed_dense4_avm_burstcount => dense_function_out_unnamed_dense4_avm_burstcount,
        out_unnamed_dense4_avm_byteenable => dense_function_out_unnamed_dense4_avm_byteenable,
        out_unnamed_dense4_avm_enable => dense_function_out_unnamed_dense4_avm_enable,
        out_unnamed_dense4_avm_read => dense_function_out_unnamed_dense4_avm_read,
        out_unnamed_dense4_avm_write => dense_function_out_unnamed_dense4_avm_write,
        out_unnamed_dense4_avm_writedata => dense_function_out_unnamed_dense4_avm_writedata,
        out_unnamed_dense5_avm_address => dense_function_out_unnamed_dense5_avm_address,
        out_unnamed_dense5_avm_burstcount => dense_function_out_unnamed_dense5_avm_burstcount,
        out_unnamed_dense5_avm_byteenable => dense_function_out_unnamed_dense5_avm_byteenable,
        out_unnamed_dense5_avm_enable => dense_function_out_unnamed_dense5_avm_enable,
        out_unnamed_dense5_avm_read => dense_function_out_unnamed_dense5_avm_read,
        out_unnamed_dense5_avm_write => dense_function_out_unnamed_dense5_avm_write,
        out_unnamed_dense5_avm_writedata => dense_function_out_unnamed_dense5_avm_writedata,
        out_valid_out => dense_function_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- avm_unnamed_dense0_address(GPOUT,69)
    avm_unnamed_dense0_address <= dense_function_out_unnamed_dense0_avm_address;

    -- avm_unnamed_dense0_burstcount(GPOUT,70)
    avm_unnamed_dense0_burstcount <= dense_function_out_unnamed_dense0_avm_burstcount;

    -- avm_unnamed_dense0_byteenable(GPOUT,71)
    avm_unnamed_dense0_byteenable <= dense_function_out_unnamed_dense0_avm_byteenable;

    -- avm_unnamed_dense0_enable(GPOUT,72)
    avm_unnamed_dense0_enable <= dense_function_out_unnamed_dense0_avm_enable;

    -- avm_unnamed_dense0_read(GPOUT,73)
    avm_unnamed_dense0_read <= dense_function_out_unnamed_dense0_avm_read;

    -- avm_unnamed_dense0_write(GPOUT,74)
    avm_unnamed_dense0_write <= dense_function_out_unnamed_dense0_avm_write;

    -- avm_unnamed_dense0_writedata(GPOUT,75)
    avm_unnamed_dense0_writedata <= dense_function_out_unnamed_dense0_avm_writedata;

    -- avm_unnamed_dense1_address(GPOUT,76)
    avm_unnamed_dense1_address <= dense_function_out_unnamed_dense1_avm_address;

    -- avm_unnamed_dense1_burstcount(GPOUT,77)
    avm_unnamed_dense1_burstcount <= dense_function_out_unnamed_dense1_avm_burstcount;

    -- avm_unnamed_dense1_byteenable(GPOUT,78)
    avm_unnamed_dense1_byteenable <= dense_function_out_unnamed_dense1_avm_byteenable;

    -- avm_unnamed_dense1_enable(GPOUT,79)
    avm_unnamed_dense1_enable <= dense_function_out_unnamed_dense1_avm_enable;

    -- avm_unnamed_dense1_read(GPOUT,80)
    avm_unnamed_dense1_read <= dense_function_out_unnamed_dense1_avm_read;

    -- avm_unnamed_dense1_write(GPOUT,81)
    avm_unnamed_dense1_write <= dense_function_out_unnamed_dense1_avm_write;

    -- avm_unnamed_dense1_writedata(GPOUT,82)
    avm_unnamed_dense1_writedata <= dense_function_out_unnamed_dense1_avm_writedata;

    -- avm_unnamed_dense3_address(GPOUT,83)
    avm_unnamed_dense3_address <= dense_function_out_unnamed_dense3_avm_address;

    -- avm_unnamed_dense3_burstcount(GPOUT,84)
    avm_unnamed_dense3_burstcount <= dense_function_out_unnamed_dense3_avm_burstcount;

    -- avm_unnamed_dense3_byteenable(GPOUT,85)
    avm_unnamed_dense3_byteenable <= dense_function_out_unnamed_dense3_avm_byteenable;

    -- avm_unnamed_dense3_enable(GPOUT,86)
    avm_unnamed_dense3_enable <= dense_function_out_unnamed_dense3_avm_enable;

    -- avm_unnamed_dense3_read(GPOUT,87)
    avm_unnamed_dense3_read <= dense_function_out_unnamed_dense3_avm_read;

    -- avm_unnamed_dense3_write(GPOUT,88)
    avm_unnamed_dense3_write <= dense_function_out_unnamed_dense3_avm_write;

    -- avm_unnamed_dense3_writedata(GPOUT,89)
    avm_unnamed_dense3_writedata <= dense_function_out_unnamed_dense3_avm_writedata;

    -- avm_unnamed_dense4_address(GPOUT,90)
    avm_unnamed_dense4_address <= dense_function_out_unnamed_dense4_avm_address;

    -- avm_unnamed_dense4_burstcount(GPOUT,91)
    avm_unnamed_dense4_burstcount <= dense_function_out_unnamed_dense4_avm_burstcount;

    -- avm_unnamed_dense4_byteenable(GPOUT,92)
    avm_unnamed_dense4_byteenable <= dense_function_out_unnamed_dense4_avm_byteenable;

    -- avm_unnamed_dense4_enable(GPOUT,93)
    avm_unnamed_dense4_enable <= dense_function_out_unnamed_dense4_avm_enable;

    -- avm_unnamed_dense4_read(GPOUT,94)
    avm_unnamed_dense4_read <= dense_function_out_unnamed_dense4_avm_read;

    -- avm_unnamed_dense4_write(GPOUT,95)
    avm_unnamed_dense4_write <= dense_function_out_unnamed_dense4_avm_write;

    -- avm_unnamed_dense4_writedata(GPOUT,96)
    avm_unnamed_dense4_writedata <= dense_function_out_unnamed_dense4_avm_writedata;

    -- avm_unnamed_dense5_address(GPOUT,97)
    avm_unnamed_dense5_address <= dense_function_out_unnamed_dense5_avm_address;

    -- avm_unnamed_dense5_burstcount(GPOUT,98)
    avm_unnamed_dense5_burstcount <= dense_function_out_unnamed_dense5_avm_burstcount;

    -- avm_unnamed_dense5_byteenable(GPOUT,99)
    avm_unnamed_dense5_byteenable <= dense_function_out_unnamed_dense5_avm_byteenable;

    -- avm_unnamed_dense5_enable(GPOUT,100)
    avm_unnamed_dense5_enable <= dense_function_out_unnamed_dense5_avm_enable;

    -- avm_unnamed_dense5_read(GPOUT,101)
    avm_unnamed_dense5_read <= dense_function_out_unnamed_dense5_avm_read;

    -- avm_unnamed_dense5_write(GPOUT,102)
    avm_unnamed_dense5_write <= dense_function_out_unnamed_dense5_avm_write;

    -- avm_unnamed_dense5_writedata(GPOUT,103)
    avm_unnamed_dense5_writedata <= dense_function_out_unnamed_dense5_avm_writedata;

    -- acl_clock2x_dummy_consumer(EXTIFACE,7)
    acl_clock2x_dummy_consumer_clock2x <= clock2x;
    acl_clock2x_dummy_consumer_clock2x_bitsignaltemp <= acl_clock2x_dummy_consumer_clock2x(0);
    acl_clock2x_dummy_consumer_myout(0) <= acl_clock2x_dummy_consumer_myout_bitsignaltemp;
    theacl_clock2x_dummy_consumer : acl_clock2x_holder
    PORT MAP (
        clock2x => acl_clock2x_dummy_consumer_clock2x_bitsignaltemp,
        myout => acl_clock2x_dummy_consumer_myout_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- clock2x_output(GPOUT,104)
    clock2x_output <= acl_clock2x_dummy_consumer_myout;

    -- is_any_lsu_active(LOGICAL,68)
    is_any_lsu_active_q <= dense_function_out_o_active_unnamed_dense1 or dense_function_out_o_active_unnamed_dense5;

    -- has_a_lsu_active(GPOUT,105)
    has_a_lsu_active <= is_any_lsu_active_q;

    -- has_a_write_pending(GPOUT,106)
    has_a_write_pending <= is_any_lsu_active_q;

    -- kernel_stall_out(GPOUT,107)
    kernel_stall_out <= dense_function_out_stall_out;

    -- kernel_valid_out(GPOUT,108)
    kernel_valid_out <= dense_function_out_valid_out;

END normal;
