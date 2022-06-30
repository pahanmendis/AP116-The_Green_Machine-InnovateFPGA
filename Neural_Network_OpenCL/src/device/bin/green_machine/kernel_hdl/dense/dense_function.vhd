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

-- VHDL created from dense_function
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

entity dense_function is
    port (
        in_arg_filter_bias : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_start : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_dense0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense1_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_dense1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense1_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense3_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_dense3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense3_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense4_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_dense4_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense4_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense4_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense5_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_dense5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense5_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_active_unnamed_dense1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_active_unnamed_dense5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_dense0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_dense0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_dense0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_dense1_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_dense1_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_dense1_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_dense1_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense1_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense1_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense1_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_dense3_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_dense3_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_dense3_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_dense3_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense3_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense3_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense3_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_dense4_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_dense4_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_dense4_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_dense4_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense4_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense4_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense4_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_dense5_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_dense5_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_dense5_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_dense5_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense5_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense5_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense5_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end dense_function;

architecture normal of dense_function is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_dense_B1_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_dense_B1_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_dense_B2_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_dense_B0 is
        port (
            in_filter_bias : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lsu_unnamed_dense0_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense1_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense1_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_arrayidx2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_global_id_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_lsu_unnamed_dense1_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense0 : out std_logic_vector(31 downto 0);  -- Floating Point
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
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_dense_B1 is
        port (
            in_add113_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_add113_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_arrayidx22_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx22_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_05_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_05_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_02_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_02_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense3_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense3_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense4_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense4_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense4_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense4_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_arrayidx22 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_cmp1_phi_decision5_xor_RM : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_global_id_05 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_inc : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_dense_B2 is
        port (
            in_arrayidx21_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe14_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_cmp1_phi_decision5_xor_RM3_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_dense5_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense5_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_dense5_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_dense0 is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_dense_B1_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B1_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B1_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_dense_B1_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B1_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B1_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B1_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_dense_B1_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B1_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B2_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_dense_B2_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B2_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B2_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B2_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B0_out_arrayidx2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_dense_B0_out_global_id_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B0_out_lsu_unnamed_dense1_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B0_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B0_out_unnamed_dense0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B0_out_unnamed_dense0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_dense_B0_out_unnamed_dense0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_dense_B0_out_unnamed_dense0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B0_out_unnamed_dense0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B0_out_unnamed_dense0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B0_out_unnamed_dense0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B0_out_unnamed_dense0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_dense_B0_out_unnamed_dense1_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_dense_B0_out_unnamed_dense1_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_dense_B0_out_unnamed_dense1_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B0_out_unnamed_dense1_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B0_out_unnamed_dense1_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B0_out_unnamed_dense1_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B0_out_unnamed_dense1_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_dense_B0_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_out_arrayidx22 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_dense_B1_out_c0_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B1_out_cmp1_phi_decision5_xor_RM : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_out_global_id_05 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B1_out_inc : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B1_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_out_unnamed_dense3_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_dense_B1_out_unnamed_dense3_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_dense_B1_out_unnamed_dense3_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B1_out_unnamed_dense3_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_out_unnamed_dense3_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_out_unnamed_dense3_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_out_unnamed_dense3_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_dense_B1_out_unnamed_dense4_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_dense_B1_out_unnamed_dense4_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_dense_B1_out_unnamed_dense4_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B1_out_unnamed_dense4_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_out_unnamed_dense4_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_out_unnamed_dense4_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_out_unnamed_dense4_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_dense_B1_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B2_out_lsu_unnamed_dense5_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B2_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B2_out_unnamed_dense5_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_dense_B2_out_unnamed_dense5_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_dense_B2_out_unnamed_dense5_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B2_out_unnamed_dense5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B2_out_unnamed_dense5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B2_out_unnamed_dense5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B2_out_unnamed_dense5_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_dense_B2_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal loop_limiter_dense0_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_dense0_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- bb_dense_B1_sr_0_aunroll_x(BLACKBOX,2)
    thebb_dense_B1_sr_0_aunroll_x : bb_dense_B1_sr_0
    PORT MAP (
        in_i_data_0 => bb_dense_B1_out_c0_exe1,
        in_i_data_1 => bb_dense_B1_out_inc,
        in_i_data_2 => bb_dense_B1_out_arrayidx22,
        in_i_data_3 => bb_dense_B1_out_global_id_05,
        in_i_stall => bb_dense_B1_out_stall_out_0,
        in_i_valid => bb_dense_B1_out_valid_out_1,
        out_o_data_0 => bb_dense_B1_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_dense_B1_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_dense_B1_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_dense_B1_sr_0_aunroll_x_out_o_data_3,
        out_o_stall => bb_dense_B1_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_dense_B1_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_dense_B1(BLACKBOX,6)
    thebb_dense_B1 : bb_dense_B1
    PORT MAP (
        in_add113_0 => bb_dense_B1_sr_0_aunroll_x_out_o_data_0,
        in_add113_1 => bb_dense_B1_sr_1_aunroll_x_out_o_data_0,
        in_arrayidx22_0 => bb_dense_B1_sr_0_aunroll_x_out_o_data_2,
        in_arrayidx22_1 => bb_dense_B1_sr_1_aunroll_x_out_o_data_2,
        in_filter_weight => in_arg_filter_weight,
        in_flush => in_start,
        in_global_id_05_0 => bb_dense_B1_sr_0_aunroll_x_out_o_data_3,
        in_global_id_05_1 => bb_dense_B1_sr_1_aunroll_x_out_o_data_3,
        in_input_im => in_arg_input_im,
        in_input_size => in_arg_input_size,
        in_j_02_0 => bb_dense_B1_sr_0_aunroll_x_out_o_data_1,
        in_j_02_1 => bb_dense_B1_sr_1_aunroll_x_out_o_data_1,
        in_stall_in_0 => bb_dense_B2_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_dense_B1_sr_0_aunroll_x_out_o_stall,
        in_unnamed_dense3_avm_readdata => in_unnamed_dense3_avm_readdata,
        in_unnamed_dense3_avm_readdatavalid => in_unnamed_dense3_avm_readdatavalid,
        in_unnamed_dense3_avm_waitrequest => in_unnamed_dense3_avm_waitrequest,
        in_unnamed_dense3_avm_writeack => in_unnamed_dense3_avm_writeack,
        in_unnamed_dense4_avm_readdata => in_unnamed_dense4_avm_readdata,
        in_unnamed_dense4_avm_readdatavalid => in_unnamed_dense4_avm_readdatavalid,
        in_unnamed_dense4_avm_waitrequest => in_unnamed_dense4_avm_waitrequest,
        in_unnamed_dense4_avm_writeack => in_unnamed_dense4_avm_writeack,
        in_valid_in_0 => bb_dense_B1_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_dense_B1_sr_1_aunroll_x_out_o_valid,
        out_arrayidx22 => bb_dense_B1_out_arrayidx22,
        out_c0_exe1 => bb_dense_B1_out_c0_exe1,
        out_cmp1_phi_decision5_xor_RM => bb_dense_B1_out_cmp1_phi_decision5_xor_RM,
        out_global_id_05 => bb_dense_B1_out_global_id_05,
        out_inc => bb_dense_B1_out_inc,
        out_stall_out_0 => bb_dense_B1_out_stall_out_0,
        out_stall_out_1 => bb_dense_B1_out_stall_out_1,
        out_unnamed_dense3_avm_address => bb_dense_B1_out_unnamed_dense3_avm_address,
        out_unnamed_dense3_avm_burstcount => bb_dense_B1_out_unnamed_dense3_avm_burstcount,
        out_unnamed_dense3_avm_byteenable => bb_dense_B1_out_unnamed_dense3_avm_byteenable,
        out_unnamed_dense3_avm_enable => bb_dense_B1_out_unnamed_dense3_avm_enable,
        out_unnamed_dense3_avm_read => bb_dense_B1_out_unnamed_dense3_avm_read,
        out_unnamed_dense3_avm_write => bb_dense_B1_out_unnamed_dense3_avm_write,
        out_unnamed_dense3_avm_writedata => bb_dense_B1_out_unnamed_dense3_avm_writedata,
        out_unnamed_dense4_avm_address => bb_dense_B1_out_unnamed_dense4_avm_address,
        out_unnamed_dense4_avm_burstcount => bb_dense_B1_out_unnamed_dense4_avm_burstcount,
        out_unnamed_dense4_avm_byteenable => bb_dense_B1_out_unnamed_dense4_avm_byteenable,
        out_unnamed_dense4_avm_enable => bb_dense_B1_out_unnamed_dense4_avm_enable,
        out_unnamed_dense4_avm_read => bb_dense_B1_out_unnamed_dense4_avm_read,
        out_unnamed_dense4_avm_write => bb_dense_B1_out_unnamed_dense4_avm_write,
        out_unnamed_dense4_avm_writedata => bb_dense_B1_out_unnamed_dense4_avm_writedata,
        out_valid_out_0 => bb_dense_B1_out_valid_out_0,
        out_valid_out_1 => bb_dense_B1_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- bb_dense_B2(BLACKBOX,7)
    thebb_dense_B2 : bb_dense_B2
    PORT MAP (
        in_arrayidx21_0 => bb_dense_B2_sr_0_aunroll_x_out_o_data_0,
        in_c0_exe14_0 => bb_dense_B2_sr_0_aunroll_x_out_o_data_2,
        in_cmp1_phi_decision5_xor_RM3_0 => bb_dense_B2_sr_0_aunroll_x_out_o_data_1,
        in_flush => in_start,
        in_lsu_unnamed_dense5_sts_stream_size => in_arg_local_size_0,
        in_stall_in_0 => in_stall_in,
        in_stream_reset => bb_dense_B1_out_valid_out_0,
        in_unnamed_dense5_avm_readdata => in_unnamed_dense5_avm_readdata,
        in_unnamed_dense5_avm_readdatavalid => in_unnamed_dense5_avm_readdatavalid,
        in_unnamed_dense5_avm_waitrequest => in_unnamed_dense5_avm_waitrequest,
        in_unnamed_dense5_avm_writeack => in_unnamed_dense5_avm_writeack,
        in_valid_in_0 => bb_dense_B2_sr_0_aunroll_x_out_o_valid,
        out_lsu_unnamed_dense5_o_active => bb_dense_B2_out_lsu_unnamed_dense5_o_active,
        out_stall_out_0 => bb_dense_B2_out_stall_out_0,
        out_unnamed_dense5_avm_address => bb_dense_B2_out_unnamed_dense5_avm_address,
        out_unnamed_dense5_avm_burstcount => bb_dense_B2_out_unnamed_dense5_avm_burstcount,
        out_unnamed_dense5_avm_byteenable => bb_dense_B2_out_unnamed_dense5_avm_byteenable,
        out_unnamed_dense5_avm_enable => bb_dense_B2_out_unnamed_dense5_avm_enable,
        out_unnamed_dense5_avm_read => bb_dense_B2_out_unnamed_dense5_avm_read,
        out_unnamed_dense5_avm_write => bb_dense_B2_out_unnamed_dense5_avm_write,
        out_unnamed_dense5_avm_writedata => bb_dense_B2_out_unnamed_dense5_avm_writedata,
        out_valid_out_0 => bb_dense_B2_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_dense_B2_sr_0_aunroll_x(BLACKBOX,4)
    thebb_dense_B2_sr_0_aunroll_x : bb_dense_B2_sr_0
    PORT MAP (
        in_i_data_0 => bb_dense_B1_out_arrayidx22,
        in_i_data_1 => bb_dense_B1_out_cmp1_phi_decision5_xor_RM,
        in_i_data_2 => bb_dense_B1_out_c0_exe1,
        in_i_stall => bb_dense_B2_out_stall_out_0,
        in_i_valid => bb_dense_B1_out_valid_out_0,
        out_o_data_0 => bb_dense_B2_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_dense_B2_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_dense_B2_sr_0_aunroll_x_out_o_data_2,
        out_o_stall => bb_dense_B2_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_dense_B2_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_0gr(CONSTANT,8)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- bb_dense_B1_sr_1_aunroll_x(BLACKBOX,3)
    thebb_dense_B1_sr_1_aunroll_x : bb_dense_B1_sr_1
    PORT MAP (
        in_i_data_0 => bb_dense_B0_out_unnamed_dense0,
        in_i_data_1 => c_i32_0gr_q,
        in_i_data_2 => bb_dense_B0_out_arrayidx2,
        in_i_data_3 => bb_dense_B0_out_global_id_0,
        in_i_stall => bb_dense_B1_out_stall_out_1,
        in_i_valid => loop_limiter_dense0_out_o_valid,
        out_o_data_0 => bb_dense_B1_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_dense_B1_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_dense_B1_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_dense_B1_sr_1_aunroll_x_out_o_data_3,
        out_o_stall => bb_dense_B1_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_dense_B1_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_dense0(BLACKBOX,45)
    theloop_limiter_dense0 : loop_limiter_dense0
    PORT MAP (
        in_i_stall => bb_dense_B1_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_dense_B2_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_dense_B0_out_valid_out_0,
        in_i_valid_exit => bb_dense_B1_out_valid_out_0,
        out_o_stall => loop_limiter_dense0_out_o_stall,
        out_o_valid => loop_limiter_dense0_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_dense_B0(BLACKBOX,5)
    thebb_dense_B0 : bb_dense_B0
    PORT MAP (
        in_filter_bias => in_arg_filter_bias,
        in_filter_weight => in_arg_filter_weight,
        in_flush => in_start,
        in_global_id_0_0 => in_arg_global_id_0,
        in_input_im => in_arg_input_im,
        in_input_size => in_arg_input_size,
        in_lsu_unnamed_dense0_sts_stream_size => in_arg_local_size_0,
        in_output_im => in_arg_output_im,
        in_stall_in_0 => loop_limiter_dense0_out_o_stall,
        in_stream_reset => in_valid_in,
        in_unnamed_dense0_avm_readdata => in_unnamed_dense0_avm_readdata,
        in_unnamed_dense0_avm_readdatavalid => in_unnamed_dense0_avm_readdatavalid,
        in_unnamed_dense0_avm_waitrequest => in_unnamed_dense0_avm_waitrequest,
        in_unnamed_dense0_avm_writeack => in_unnamed_dense0_avm_writeack,
        in_unnamed_dense1_avm_readdata => in_unnamed_dense1_avm_readdata,
        in_unnamed_dense1_avm_readdatavalid => in_unnamed_dense1_avm_readdatavalid,
        in_unnamed_dense1_avm_waitrequest => in_unnamed_dense1_avm_waitrequest,
        in_unnamed_dense1_avm_writeack => in_unnamed_dense1_avm_writeack,
        in_valid_in_0 => in_valid_in,
        out_arrayidx2 => bb_dense_B0_out_arrayidx2,
        out_global_id_0 => bb_dense_B0_out_global_id_0,
        out_lsu_unnamed_dense1_o_active => bb_dense_B0_out_lsu_unnamed_dense1_o_active,
        out_stall_out_0 => bb_dense_B0_out_stall_out_0,
        out_unnamed_dense0 => bb_dense_B0_out_unnamed_dense0,
        out_unnamed_dense0_avm_address => bb_dense_B0_out_unnamed_dense0_avm_address,
        out_unnamed_dense0_avm_burstcount => bb_dense_B0_out_unnamed_dense0_avm_burstcount,
        out_unnamed_dense0_avm_byteenable => bb_dense_B0_out_unnamed_dense0_avm_byteenable,
        out_unnamed_dense0_avm_enable => bb_dense_B0_out_unnamed_dense0_avm_enable,
        out_unnamed_dense0_avm_read => bb_dense_B0_out_unnamed_dense0_avm_read,
        out_unnamed_dense0_avm_write => bb_dense_B0_out_unnamed_dense0_avm_write,
        out_unnamed_dense0_avm_writedata => bb_dense_B0_out_unnamed_dense0_avm_writedata,
        out_unnamed_dense1_avm_address => bb_dense_B0_out_unnamed_dense1_avm_address,
        out_unnamed_dense1_avm_burstcount => bb_dense_B0_out_unnamed_dense1_avm_burstcount,
        out_unnamed_dense1_avm_byteenable => bb_dense_B0_out_unnamed_dense1_avm_byteenable,
        out_unnamed_dense1_avm_enable => bb_dense_B0_out_unnamed_dense1_avm_enable,
        out_unnamed_dense1_avm_read => bb_dense_B0_out_unnamed_dense1_avm_read,
        out_unnamed_dense1_avm_write => bb_dense_B0_out_unnamed_dense1_avm_write,
        out_unnamed_dense1_avm_writedata => bb_dense_B0_out_unnamed_dense1_avm_writedata,
        out_valid_out_0 => bb_dense_B0_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_o_active_unnamed_dense1(GPOUT,46)
    out_o_active_unnamed_dense1 <= bb_dense_B0_out_lsu_unnamed_dense1_o_active;

    -- out_o_active_unnamed_dense5(GPOUT,47)
    out_o_active_unnamed_dense5 <= bb_dense_B2_out_lsu_unnamed_dense5_o_active;

    -- out_stall_out(GPOUT,48)
    out_stall_out <= bb_dense_B0_out_stall_out_0;

    -- out_unnamed_dense0_avm_address(GPOUT,49)
    out_unnamed_dense0_avm_address <= bb_dense_B0_out_unnamed_dense0_avm_address;

    -- out_unnamed_dense0_avm_burstcount(GPOUT,50)
    out_unnamed_dense0_avm_burstcount <= bb_dense_B0_out_unnamed_dense0_avm_burstcount;

    -- out_unnamed_dense0_avm_byteenable(GPOUT,51)
    out_unnamed_dense0_avm_byteenable <= bb_dense_B0_out_unnamed_dense0_avm_byteenable;

    -- out_unnamed_dense0_avm_enable(GPOUT,52)
    out_unnamed_dense0_avm_enable <= bb_dense_B0_out_unnamed_dense0_avm_enable;

    -- out_unnamed_dense0_avm_read(GPOUT,53)
    out_unnamed_dense0_avm_read <= bb_dense_B0_out_unnamed_dense0_avm_read;

    -- out_unnamed_dense0_avm_write(GPOUT,54)
    out_unnamed_dense0_avm_write <= bb_dense_B0_out_unnamed_dense0_avm_write;

    -- out_unnamed_dense0_avm_writedata(GPOUT,55)
    out_unnamed_dense0_avm_writedata <= bb_dense_B0_out_unnamed_dense0_avm_writedata;

    -- out_unnamed_dense1_avm_address(GPOUT,56)
    out_unnamed_dense1_avm_address <= bb_dense_B0_out_unnamed_dense1_avm_address;

    -- out_unnamed_dense1_avm_burstcount(GPOUT,57)
    out_unnamed_dense1_avm_burstcount <= bb_dense_B0_out_unnamed_dense1_avm_burstcount;

    -- out_unnamed_dense1_avm_byteenable(GPOUT,58)
    out_unnamed_dense1_avm_byteenable <= bb_dense_B0_out_unnamed_dense1_avm_byteenable;

    -- out_unnamed_dense1_avm_enable(GPOUT,59)
    out_unnamed_dense1_avm_enable <= bb_dense_B0_out_unnamed_dense1_avm_enable;

    -- out_unnamed_dense1_avm_read(GPOUT,60)
    out_unnamed_dense1_avm_read <= bb_dense_B0_out_unnamed_dense1_avm_read;

    -- out_unnamed_dense1_avm_write(GPOUT,61)
    out_unnamed_dense1_avm_write <= bb_dense_B0_out_unnamed_dense1_avm_write;

    -- out_unnamed_dense1_avm_writedata(GPOUT,62)
    out_unnamed_dense1_avm_writedata <= bb_dense_B0_out_unnamed_dense1_avm_writedata;

    -- out_unnamed_dense3_avm_address(GPOUT,63)
    out_unnamed_dense3_avm_address <= bb_dense_B1_out_unnamed_dense3_avm_address;

    -- out_unnamed_dense3_avm_burstcount(GPOUT,64)
    out_unnamed_dense3_avm_burstcount <= bb_dense_B1_out_unnamed_dense3_avm_burstcount;

    -- out_unnamed_dense3_avm_byteenable(GPOUT,65)
    out_unnamed_dense3_avm_byteenable <= bb_dense_B1_out_unnamed_dense3_avm_byteenable;

    -- out_unnamed_dense3_avm_enable(GPOUT,66)
    out_unnamed_dense3_avm_enable <= bb_dense_B1_out_unnamed_dense3_avm_enable;

    -- out_unnamed_dense3_avm_read(GPOUT,67)
    out_unnamed_dense3_avm_read <= bb_dense_B1_out_unnamed_dense3_avm_read;

    -- out_unnamed_dense3_avm_write(GPOUT,68)
    out_unnamed_dense3_avm_write <= bb_dense_B1_out_unnamed_dense3_avm_write;

    -- out_unnamed_dense3_avm_writedata(GPOUT,69)
    out_unnamed_dense3_avm_writedata <= bb_dense_B1_out_unnamed_dense3_avm_writedata;

    -- out_unnamed_dense4_avm_address(GPOUT,70)
    out_unnamed_dense4_avm_address <= bb_dense_B1_out_unnamed_dense4_avm_address;

    -- out_unnamed_dense4_avm_burstcount(GPOUT,71)
    out_unnamed_dense4_avm_burstcount <= bb_dense_B1_out_unnamed_dense4_avm_burstcount;

    -- out_unnamed_dense4_avm_byteenable(GPOUT,72)
    out_unnamed_dense4_avm_byteenable <= bb_dense_B1_out_unnamed_dense4_avm_byteenable;

    -- out_unnamed_dense4_avm_enable(GPOUT,73)
    out_unnamed_dense4_avm_enable <= bb_dense_B1_out_unnamed_dense4_avm_enable;

    -- out_unnamed_dense4_avm_read(GPOUT,74)
    out_unnamed_dense4_avm_read <= bb_dense_B1_out_unnamed_dense4_avm_read;

    -- out_unnamed_dense4_avm_write(GPOUT,75)
    out_unnamed_dense4_avm_write <= bb_dense_B1_out_unnamed_dense4_avm_write;

    -- out_unnamed_dense4_avm_writedata(GPOUT,76)
    out_unnamed_dense4_avm_writedata <= bb_dense_B1_out_unnamed_dense4_avm_writedata;

    -- out_unnamed_dense5_avm_address(GPOUT,77)
    out_unnamed_dense5_avm_address <= bb_dense_B2_out_unnamed_dense5_avm_address;

    -- out_unnamed_dense5_avm_burstcount(GPOUT,78)
    out_unnamed_dense5_avm_burstcount <= bb_dense_B2_out_unnamed_dense5_avm_burstcount;

    -- out_unnamed_dense5_avm_byteenable(GPOUT,79)
    out_unnamed_dense5_avm_byteenable <= bb_dense_B2_out_unnamed_dense5_avm_byteenable;

    -- out_unnamed_dense5_avm_enable(GPOUT,80)
    out_unnamed_dense5_avm_enable <= bb_dense_B2_out_unnamed_dense5_avm_enable;

    -- out_unnamed_dense5_avm_read(GPOUT,81)
    out_unnamed_dense5_avm_read <= bb_dense_B2_out_unnamed_dense5_avm_read;

    -- out_unnamed_dense5_avm_write(GPOUT,82)
    out_unnamed_dense5_avm_write <= bb_dense_B2_out_unnamed_dense5_avm_write;

    -- out_unnamed_dense5_avm_writedata(GPOUT,83)
    out_unnamed_dense5_avm_writedata <= bb_dense_B2_out_unnamed_dense5_avm_writedata;

    -- out_valid_out(GPOUT,84)
    out_valid_out <= bb_dense_B2_out_valid_out_0;

END normal;
