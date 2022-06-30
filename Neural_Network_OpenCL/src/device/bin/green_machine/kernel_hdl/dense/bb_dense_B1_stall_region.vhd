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

-- VHDL created from bb_dense_B1_stall_region
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

entity bb_dense_B1_stall_region is
    port (
        in_unnamed_dense4_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_dense4_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense4_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense4_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense4_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_dense4_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense4_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense4_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense4_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_dense4_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_dense4_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_add113 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_arrayidx22 : in std_logic_vector(63 downto 0);  -- ufix64
        in_global_id_05 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_02 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_arrayidx22 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_cmp1_phi_decision5_xor_RM : out std_logic_vector(0 downto 0);  -- ufix1
        out_global_id_05 : out std_logic_vector(31 downto 0);  -- ufix32
        out_inc : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_dense2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_dense3_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_dense3_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense3_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_dense3_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense3_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense3_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense3_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_dense3_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_dense3_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_dense_B1_stall_region;

architecture normal of bb_dense_B1_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component dense_B1_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_body_dense_c0_enter_dense is
        port (
            in_c0_eni3_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni3_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni3_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni3_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_dense3_dense22 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense3_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense3_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense3_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_dense3_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_dense3_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_dense3_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense3_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense3_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense3_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_dense4_dense26 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense4_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense4_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense4_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense4_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense4_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_dense4_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_dense4_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_dense4_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense4_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense4_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense4_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_filter_weight_sync_buffer_dense15 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_input_im_sync_buffer_dense10 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_input_size_sync_buffer1_dense12 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_input_size_sync_buffer_dense17 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_data_fifo is
        generic (
            DEPTH : INTEGER := 0;
            DATA_WIDTH : INTEGER := 32;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0;
            IMPL : STRING := "ram"
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            data_in : in std_logic_vector(DATA_WIDTH - 1 downto 0);
            valid_out : out std_logic;
            stall_out : out std_logic;
            data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            full : out std_logic;
            almost_full : out std_logic
        );
    end component;






    component acl_valid_fifo_counter is
        generic (
            DEPTH : INTEGER := 0;
            ASYNC_RESET : INTEGER := 1;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            valid_out : out std_logic;
            stall_out : out std_logic;
            full : out std_logic
        );
    end component;





    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add_dense_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_inc_dense_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_B1_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_B1_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_B1_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal dense_B1_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_B1_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B1_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx7_dense_dense20_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx7_dense_dense20_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx7_dense_dense20_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx7_dense_dense20_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx7_dense_dense20_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx7_dense_dense20_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx7_dense_dense20_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx7_dense_dense20_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx9_dense_dense25_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx9_dense_dense25_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx9_dense_dense25_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx9_dense_dense25_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx9_dense_dense25_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx9_dense_dense25_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx9_dense_dense25_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom6_dense_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom8_dense_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_body_dense_c0_enter_dense_aunroll_x_out_c0_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body_dense_c0_enter_dense_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body_dense_c0_enter_dense_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_dense_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_dense_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_dense_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_dense_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_cmp1_phi_decision5_xor_rm_dense_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp1_phi_decision5_xor_rm_dense_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp1_phi_decision5_xor_rm_dense_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp1_phi_decision5_xor_rm_dense_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_dense_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_dense_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_inc_dense_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_dense_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_dense_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_dense_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_load_unnamed_dense3_dense_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_dense3_dense_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_dense3_dense_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_unnamed_dense4_dense_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_dense4_dense_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_dense4_dense_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_mul_rm_dense_vt_const_6_q : STD_LOGIC_VECTOR (6 downto 0);
    signal i_mul_rm_dense_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul_rm_dense_vt_select_31_b : STD_LOGIC_VECTOR (24 downto 0);
    signal i_syncbuf_filter_weight_sync_buffer_dense_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_filter_weight_sync_buffer_dense_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_filter_weight_sync_buffer_dense_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_im_sync_buffer_dense_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_input_im_sync_buffer_dense_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_im_sync_buffer_dense_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_size_sync_buffer1_dense_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_sync_buffer1_dense_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_size_sync_buffer1_dense_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_size_sync_buffer_dense_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_sync_buffer_dense_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_size_sync_buffer_dense_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_dense24_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal leftShiftStage0Idx1Pad4_uid133_i_mul_rm_dense_dense14_shift_x_q : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx1Rng4_uid134_i_mul_rm_dense_dense14_shift_x_in : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx1Rng4_uid134_i_mul_rm_dense_dense14_shift_x_b : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx1_uid135_i_mul_rm_dense_dense14_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid137_i_mul_rm_dense_dense14_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid137_i_mul_rm_dense_dense14_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx1Pad2_uid138_i_mul_rm_dense_dense14_shift_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1Idx1Rng2_uid139_i_mul_rm_dense_dense14_shift_x_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx1Rng2_uid139_i_mul_rm_dense_dense14_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx1_uid140_i_mul_rm_dense_dense14_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1_uid142_i_mul_rm_dense_dense14_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid142_i_mul_rm_dense_dense14_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage2Idx1Rng1_uid144_i_mul_rm_dense_dense14_shift_x_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage2Idx1Rng1_uid144_i_mul_rm_dense_dense14_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage2Idx1_uid145_i_mul_rm_dense_dense14_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage2_uid147_i_mul_rm_dense_dense14_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid147_i_mul_rm_dense_dense14_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx7_dense_dense20_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx9_dense_dense25_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_i_arrayidx7_dense_dense20_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_bgTrunc_i_add_dense_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_dense_B1_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (159 downto 0);
    signal bubble_select_dense_B1_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_dense_B1_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_dense_B1_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_dense_B1_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c0_for_body_dense_c0_enter_dense_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_body_dense_c0_enter_dense_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_dense3_dense_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_dense3_dense_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_dense4_dense_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_dense4_dense_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_filter_weight_sync_buffer_dense_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_filter_weight_sync_buffer_dense_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_syncbuf_input_im_sync_buffer_dense_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_input_im_sync_buffer_dense_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_syncbuf_input_size_sync_buffer1_dense_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_input_size_sync_buffer1_dense_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_input_size_sync_buffer_dense_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_input_size_sync_buffer_dense_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (159 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B1_merge_reg_aunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_dense_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_dense_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_dense_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_dense_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_dense_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_dense_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_dense_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_dense_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_dense_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_dense_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_dense_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_im_sync_buffer_dense_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_im_sync_buffer_dense_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_im_sync_buffer_dense_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_im_sync_buffer_dense_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_im_sync_buffer_dense_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer1_dense_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer1_dense_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer1_dense_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer1_dense_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer1_dense_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer1_dense_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer1_dense_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer1_dense_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer1_dense_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer1_dense_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer1_dense_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer1_dense_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer1_dense_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer1_dense_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer1_dense_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer1_dense_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer1_dense_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer1_dense_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer_dense_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer_dense_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer_dense_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer_dense_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer_dense_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer_dense_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer_dense_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer_dense_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer_dense_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer_dense_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer_dense_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer_dense_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_sync_buffer_dense_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_2_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_3_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_4_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_r_data1 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_D1 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond_dense_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond_dense_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond_dense_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond_dense_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond_dense_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond_dense_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond_dense_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond_dense_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond_dense_D1 : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- bubble_join_dense_B1_merge_reg_aunroll_x(BITJOIN,185)
    bubble_join_dense_B1_merge_reg_aunroll_x_q <= dense_B1_merge_reg_aunroll_x_out_data_out_3 & dense_B1_merge_reg_aunroll_x_out_data_out_2 & dense_B1_merge_reg_aunroll_x_out_data_out_1 & dense_B1_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_dense_B1_merge_reg_aunroll_x(BITSELECT,186)
    bubble_select_dense_B1_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_dense_B1_merge_reg_aunroll_x_q(31 downto 0));
    bubble_select_dense_B1_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_dense_B1_merge_reg_aunroll_x_q(63 downto 32));
    bubble_select_dense_B1_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_dense_B1_merge_reg_aunroll_x_q(127 downto 64));
    bubble_select_dense_B1_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_dense_B1_merge_reg_aunroll_x_q(159 downto 128));

    -- redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo(STALLFIFO,176)
    redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_valid_in <= SE_out_dense_B1_merge_reg_aunroll_x_V5;
    redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_stall_in <= SE_out_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_backStall;
    redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_data_in <= bubble_select_dense_B1_merge_reg_aunroll_x_b;
    redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_valid_in_bitsignaltemp <= redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_valid_in(0);
    redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_stall_in_bitsignaltemp <= redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_stall_in(0);
    redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_valid_out(0) <= redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_valid_out_bitsignaltemp;
    redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_stall_out(0) <= redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_stall_out_bitsignaltemp;
    theredist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 186,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_valid_in_bitsignaltemp,
        stall_in => redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_dense_B1_merge_reg_aunroll_x_b,
        valid_out => redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_valid_out_bitsignaltemp,
        stall_out => redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_stall_out_bitsignaltemp,
        data_out => redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx7_dense_dense20_mult_multconst_x(CONSTANT,31)
    i_arrayidx7_dense_dense20_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0(REG,177)
    redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_backEN = "1") THEN
                redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_q <= STD_LOGIC_VECTOR(bubble_select_dense_B1_merge_reg_aunroll_x_c);
            END IF;
        END IF;
    END PROCESS;

    -- i_idxprom6_dense_sel_x(BITSELECT,47)@2
    i_idxprom6_dense_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_q(31 downto 0)), 64)));

    -- i_arrayidx7_dense_dense20_mult_x_bs1_merged_bit_select(BITSELECT,160)@2
    i_arrayidx7_dense_dense20_mult_x_bs1_merged_bit_select_b <= i_idxprom6_dense_sel_x_b(17 downto 0);
    i_arrayidx7_dense_dense20_mult_x_bs1_merged_bit_select_c <= i_idxprom6_dense_sel_x_b(63 downto 54);
    i_arrayidx7_dense_dense20_mult_x_bs1_merged_bit_select_d <= i_idxprom6_dense_sel_x_b(35 downto 18);
    i_arrayidx7_dense_dense20_mult_x_bs1_merged_bit_select_e <= i_idxprom6_dense_sel_x_b(53 downto 36);

    -- i_arrayidx7_dense_dense20_mult_x_im3_shift0(BITSHIFT,153)@2
    i_arrayidx7_dense_dense20_mult_x_im3_shift0_qint <= i_arrayidx7_dense_dense20_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx7_dense_dense20_mult_x_im3_shift0_q <= i_arrayidx7_dense_dense20_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx7_dense_dense20_mult_x_align_15(BITSHIFT,108)@2
    i_arrayidx7_dense_dense20_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx7_dense_dense20_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx7_dense_dense20_mult_x_align_15_q <= i_arrayidx7_dense_dense20_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx7_dense_dense20_mult_x_im6_shift0(BITSHIFT,154)@2
    i_arrayidx7_dense_dense20_mult_x_im6_shift0_qint <= i_arrayidx7_dense_dense20_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx7_dense_dense20_mult_x_im6_shift0_q <= i_arrayidx7_dense_dense20_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx7_dense_dense20_mult_x_align_14(BITSHIFT,107)@2
    i_arrayidx7_dense_dense20_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx7_dense_dense20_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx7_dense_dense20_mult_x_align_14_q <= i_arrayidx7_dense_dense20_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx7_dense_dense20_mult_x_join_16(BITJOIN,109)@2
    i_arrayidx7_dense_dense20_mult_x_join_16_q <= i_arrayidx7_dense_dense20_mult_x_align_15_q & i_arrayidx7_dense_dense20_mult_x_align_14_q;

    -- i_arrayidx7_dense_dense20_mult_x_im9_shift0(BITSHIFT,155)@2
    i_arrayidx7_dense_dense20_mult_x_im9_shift0_qint <= i_arrayidx7_dense_dense20_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx7_dense_dense20_mult_x_im9_shift0_q <= i_arrayidx7_dense_dense20_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx7_dense_dense20_mult_x_align_12(BITSHIFT,105)@2
    i_arrayidx7_dense_dense20_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx7_dense_dense20_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx7_dense_dense20_mult_x_align_12_q <= i_arrayidx7_dense_dense20_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx7_dense_dense20_mult_x_im0_shift0(BITSHIFT,152)@2
    i_arrayidx7_dense_dense20_mult_x_im0_shift0_qint <= i_arrayidx7_dense_dense20_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx7_dense_dense20_mult_x_im0_shift0_q <= i_arrayidx7_dense_dense20_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx7_dense_dense20_mult_x_join_13(BITJOIN,106)@2
    i_arrayidx7_dense_dense20_mult_x_join_13_q <= i_arrayidx7_dense_dense20_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx7_dense_dense20_mult_x_im0_shift0_q);

    -- i_arrayidx7_dense_dense20_mult_x_result_add_0_0(ADD,110)@2
    i_arrayidx7_dense_dense20_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx7_dense_dense20_mult_x_join_13_q);
    i_arrayidx7_dense_dense20_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx7_dense_dense20_mult_x_join_16_q);
    i_arrayidx7_dense_dense20_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx7_dense_dense20_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx7_dense_dense20_mult_x_result_add_0_0_b));
    i_arrayidx7_dense_dense20_mult_x_result_add_0_0_q <= i_arrayidx7_dense_dense20_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx7_dense_dense20_mult_extender_x(BITJOIN,30)@2
    i_arrayidx7_dense_dense20_mult_extender_x_q <= i_arrayidx7_dense_dense20_mult_multconst_x_q & i_arrayidx7_dense_dense20_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx7_dense_dense20_trunc_sel_x(BITSELECT,32)@2
    i_arrayidx7_dense_dense20_trunc_sel_x_b <= i_arrayidx7_dense_dense20_mult_extender_x_q(63 downto 0);

    -- leftShiftStage2Idx1Rng1_uid144_i_mul_rm_dense_dense14_shift_x(BITSELECT,143)@1
    leftShiftStage2Idx1Rng1_uid144_i_mul_rm_dense_dense14_shift_x_in <= leftShiftStage1_uid142_i_mul_rm_dense_dense14_shift_x_q(30 downto 0);
    leftShiftStage2Idx1Rng1_uid144_i_mul_rm_dense_dense14_shift_x_b <= leftShiftStage2Idx1Rng1_uid144_i_mul_rm_dense_dense14_shift_x_in(30 downto 0);

    -- leftShiftStage2Idx1_uid145_i_mul_rm_dense_dense14_shift_x(BITJOIN,144)@1
    leftShiftStage2Idx1_uid145_i_mul_rm_dense_dense14_shift_x_q <= leftShiftStage2Idx1Rng1_uid144_i_mul_rm_dense_dense14_shift_x_b & GND_q;

    -- leftShiftStage1Idx1Rng2_uid139_i_mul_rm_dense_dense14_shift_x(BITSELECT,138)@1
    leftShiftStage1Idx1Rng2_uid139_i_mul_rm_dense_dense14_shift_x_in <= leftShiftStage0_uid137_i_mul_rm_dense_dense14_shift_x_q(29 downto 0);
    leftShiftStage1Idx1Rng2_uid139_i_mul_rm_dense_dense14_shift_x_b <= leftShiftStage1Idx1Rng2_uid139_i_mul_rm_dense_dense14_shift_x_in(29 downto 0);

    -- leftShiftStage1Idx1Pad2_uid138_i_mul_rm_dense_dense14_shift_x(CONSTANT,137)
    leftShiftStage1Idx1Pad2_uid138_i_mul_rm_dense_dense14_shift_x_q <= "00";

    -- leftShiftStage1Idx1_uid140_i_mul_rm_dense_dense14_shift_x(BITJOIN,139)@1
    leftShiftStage1Idx1_uid140_i_mul_rm_dense_dense14_shift_x_q <= leftShiftStage1Idx1Rng2_uid139_i_mul_rm_dense_dense14_shift_x_b & leftShiftStage1Idx1Pad2_uid138_i_mul_rm_dense_dense14_shift_x_q;

    -- leftShiftStage0Idx1Rng4_uid134_i_mul_rm_dense_dense14_shift_x(BITSELECT,133)@1
    leftShiftStage0Idx1Rng4_uid134_i_mul_rm_dense_dense14_shift_x_in <= bubble_select_dense_B1_merge_reg_aunroll_x_e(27 downto 0);
    leftShiftStage0Idx1Rng4_uid134_i_mul_rm_dense_dense14_shift_x_b <= leftShiftStage0Idx1Rng4_uid134_i_mul_rm_dense_dense14_shift_x_in(27 downto 0);

    -- leftShiftStage0Idx1Pad4_uid133_i_mul_rm_dense_dense14_shift_x(CONSTANT,132)
    leftShiftStage0Idx1Pad4_uid133_i_mul_rm_dense_dense14_shift_x_q <= "0000";

    -- leftShiftStage0Idx1_uid135_i_mul_rm_dense_dense14_shift_x(BITJOIN,134)@1
    leftShiftStage0Idx1_uid135_i_mul_rm_dense_dense14_shift_x_q <= leftShiftStage0Idx1Rng4_uid134_i_mul_rm_dense_dense14_shift_x_b & leftShiftStage0Idx1Pad4_uid133_i_mul_rm_dense_dense14_shift_x_q;

    -- leftShiftStage0_uid137_i_mul_rm_dense_dense14_shift_x(MUX,136)@1
    leftShiftStage0_uid137_i_mul_rm_dense_dense14_shift_x_s <= VCC_q;
    leftShiftStage0_uid137_i_mul_rm_dense_dense14_shift_x_combproc: PROCESS (leftShiftStage0_uid137_i_mul_rm_dense_dense14_shift_x_s, bubble_select_dense_B1_merge_reg_aunroll_x_e, leftShiftStage0Idx1_uid135_i_mul_rm_dense_dense14_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid137_i_mul_rm_dense_dense14_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid137_i_mul_rm_dense_dense14_shift_x_q <= bubble_select_dense_B1_merge_reg_aunroll_x_e;
            WHEN "1" => leftShiftStage0_uid137_i_mul_rm_dense_dense14_shift_x_q <= leftShiftStage0Idx1_uid135_i_mul_rm_dense_dense14_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid137_i_mul_rm_dense_dense14_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid142_i_mul_rm_dense_dense14_shift_x(MUX,141)@1
    leftShiftStage1_uid142_i_mul_rm_dense_dense14_shift_x_s <= VCC_q;
    leftShiftStage1_uid142_i_mul_rm_dense_dense14_shift_x_combproc: PROCESS (leftShiftStage1_uid142_i_mul_rm_dense_dense14_shift_x_s, leftShiftStage0_uid137_i_mul_rm_dense_dense14_shift_x_q, leftShiftStage1Idx1_uid140_i_mul_rm_dense_dense14_shift_x_q)
    BEGIN
        CASE (leftShiftStage1_uid142_i_mul_rm_dense_dense14_shift_x_s) IS
            WHEN "0" => leftShiftStage1_uid142_i_mul_rm_dense_dense14_shift_x_q <= leftShiftStage0_uid137_i_mul_rm_dense_dense14_shift_x_q;
            WHEN "1" => leftShiftStage1_uid142_i_mul_rm_dense_dense14_shift_x_q <= leftShiftStage1Idx1_uid140_i_mul_rm_dense_dense14_shift_x_q;
            WHEN OTHERS => leftShiftStage1_uid142_i_mul_rm_dense_dense14_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage2_uid147_i_mul_rm_dense_dense14_shift_x(MUX,146)@1
    leftShiftStage2_uid147_i_mul_rm_dense_dense14_shift_x_s <= VCC_q;
    leftShiftStage2_uid147_i_mul_rm_dense_dense14_shift_x_combproc: PROCESS (leftShiftStage2_uid147_i_mul_rm_dense_dense14_shift_x_s, leftShiftStage1_uid142_i_mul_rm_dense_dense14_shift_x_q, leftShiftStage2Idx1_uid145_i_mul_rm_dense_dense14_shift_x_q)
    BEGIN
        CASE (leftShiftStage2_uid147_i_mul_rm_dense_dense14_shift_x_s) IS
            WHEN "0" => leftShiftStage2_uid147_i_mul_rm_dense_dense14_shift_x_q <= leftShiftStage1_uid142_i_mul_rm_dense_dense14_shift_x_q;
            WHEN "1" => leftShiftStage2_uid147_i_mul_rm_dense_dense14_shift_x_q <= leftShiftStage2Idx1_uid145_i_mul_rm_dense_dense14_shift_x_q;
            WHEN OTHERS => leftShiftStage2_uid147_i_mul_rm_dense_dense14_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_mul_rm_dense_vt_select_31(BITSELECT,75)@1
    i_mul_rm_dense_vt_select_31_b <= leftShiftStage2_uid147_i_mul_rm_dense_dense14_shift_x_q(31 downto 7);

    -- i_mul_rm_dense_vt_const_6(CONSTANT,73)
    i_mul_rm_dense_vt_const_6_q <= "0000000";

    -- i_mul_rm_dense_vt_join(BITJOIN,74)@1
    i_mul_rm_dense_vt_join_q <= i_mul_rm_dense_vt_select_31_b & i_mul_rm_dense_vt_const_6_q;

    -- i_add_dense(ADD,63)@1
    i_add_dense_a <= STD_LOGIC_VECTOR("0" & bubble_select_dense_B1_merge_reg_aunroll_x_c);
    i_add_dense_b <= STD_LOGIC_VECTOR("0" & i_mul_rm_dense_vt_join_q);
    i_add_dense_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_dense_a) + UNSIGNED(i_add_dense_b));
    i_add_dense_q <= i_add_dense_o(32 downto 0);

    -- bgTrunc_i_add_dense_sel_x(BITSELECT,2)@1
    bgTrunc_i_add_dense_sel_x_b <= i_add_dense_q(31 downto 0);

    -- redist10_bgTrunc_i_add_dense_sel_x_b_1_0(REG,183)
    redist10_bgTrunc_i_add_dense_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_bgTrunc_i_add_dense_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_backEN = "1") THEN
                redist10_bgTrunc_i_add_dense_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(bgTrunc_i_add_dense_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- i_idxprom8_dense_sel_x(BITSELECT,48)@2
    i_idxprom8_dense_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist10_bgTrunc_i_add_dense_sel_x_b_1_0_q(31 downto 0)), 64)));

    -- i_arrayidx9_dense_dense25_mult_x_bs1_merged_bit_select(BITSELECT,161)@2
    i_arrayidx9_dense_dense25_mult_x_bs1_merged_bit_select_b <= i_idxprom8_dense_sel_x_b(17 downto 0);
    i_arrayidx9_dense_dense25_mult_x_bs1_merged_bit_select_c <= i_idxprom8_dense_sel_x_b(63 downto 54);
    i_arrayidx9_dense_dense25_mult_x_bs1_merged_bit_select_d <= i_idxprom8_dense_sel_x_b(35 downto 18);
    i_arrayidx9_dense_dense25_mult_x_bs1_merged_bit_select_e <= i_idxprom8_dense_sel_x_b(53 downto 36);

    -- i_arrayidx9_dense_dense25_mult_x_im3_shift0(BITSHIFT,157)@2
    i_arrayidx9_dense_dense25_mult_x_im3_shift0_qint <= i_arrayidx9_dense_dense25_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx9_dense_dense25_mult_x_im3_shift0_q <= i_arrayidx9_dense_dense25_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx9_dense_dense25_mult_x_align_15(BITSHIFT,126)@2
    i_arrayidx9_dense_dense25_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx9_dense_dense25_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx9_dense_dense25_mult_x_align_15_q <= i_arrayidx9_dense_dense25_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx9_dense_dense25_mult_x_im6_shift0(BITSHIFT,158)@2
    i_arrayidx9_dense_dense25_mult_x_im6_shift0_qint <= i_arrayidx9_dense_dense25_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx9_dense_dense25_mult_x_im6_shift0_q <= i_arrayidx9_dense_dense25_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx9_dense_dense25_mult_x_align_14(BITSHIFT,125)@2
    i_arrayidx9_dense_dense25_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx9_dense_dense25_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx9_dense_dense25_mult_x_align_14_q <= i_arrayidx9_dense_dense25_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx9_dense_dense25_mult_x_join_16(BITJOIN,127)@2
    i_arrayidx9_dense_dense25_mult_x_join_16_q <= i_arrayidx9_dense_dense25_mult_x_align_15_q & i_arrayidx9_dense_dense25_mult_x_align_14_q;

    -- i_arrayidx9_dense_dense25_mult_x_im9_shift0(BITSHIFT,159)@2
    i_arrayidx9_dense_dense25_mult_x_im9_shift0_qint <= i_arrayidx9_dense_dense25_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx9_dense_dense25_mult_x_im9_shift0_q <= i_arrayidx9_dense_dense25_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx9_dense_dense25_mult_x_align_12(BITSHIFT,123)@2
    i_arrayidx9_dense_dense25_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx9_dense_dense25_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx9_dense_dense25_mult_x_align_12_q <= i_arrayidx9_dense_dense25_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx9_dense_dense25_mult_x_im0_shift0(BITSHIFT,156)@2
    i_arrayidx9_dense_dense25_mult_x_im0_shift0_qint <= i_arrayidx9_dense_dense25_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx9_dense_dense25_mult_x_im0_shift0_q <= i_arrayidx9_dense_dense25_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx9_dense_dense25_mult_x_join_13(BITJOIN,124)@2
    i_arrayidx9_dense_dense25_mult_x_join_13_q <= i_arrayidx9_dense_dense25_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx9_dense_dense25_mult_x_im0_shift0_q);

    -- i_arrayidx9_dense_dense25_mult_x_result_add_0_0(ADD,128)@2
    i_arrayidx9_dense_dense25_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx9_dense_dense25_mult_x_join_13_q);
    i_arrayidx9_dense_dense25_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx9_dense_dense25_mult_x_join_16_q);
    i_arrayidx9_dense_dense25_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx9_dense_dense25_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx9_dense_dense25_mult_x_result_add_0_0_b));
    i_arrayidx9_dense_dense25_mult_x_result_add_0_0_q <= i_arrayidx9_dense_dense25_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx9_dense_dense25_mult_extender_x(BITJOIN,40)@2
    i_arrayidx9_dense_dense25_mult_extender_x_q <= i_arrayidx7_dense_dense20_mult_multconst_x_q & i_arrayidx9_dense_dense25_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx9_dense_dense25_trunc_sel_x(BITSELECT,42)@2
    i_arrayidx9_dense_dense25_trunc_sel_x_b <= i_arrayidx9_dense_dense25_mult_extender_x_q(63 downto 0);

    -- SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0(STALLREG,392)
    SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_r_data0 <= (others => '-');
            SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_r_valid <= SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_backStall and (SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_r_valid or SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(i_arrayidx9_dense_dense25_trunc_sel_x_b);
                SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_r_data1 <= STD_LOGIC_VECTOR(i_arrayidx7_dense_dense20_trunc_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_i_valid <= SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_V1;
    -- Stall signal propagation
    SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_backStall <= SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_r_valid or not (SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_V <= SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_r_valid WHEN SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_i_valid;

    -- Data0
    SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_D0 <= SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_r_data0 WHEN SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_r_valid = "1" ELSE i_arrayidx9_dense_dense25_trunc_sel_x_b;
    -- Data1
    SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_D1 <= SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_r_data1 WHEN SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_r_valid = "1" ELSE i_arrayidx7_dense_dense20_trunc_sel_x_b;

    -- SE_out_redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo(STALLENABLE,309)
    -- Valid signal propagation
    SE_out_redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_V0 <= SE_out_redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_backStall <= SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_backStall or not (SE_out_redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_wireValid <= redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_valid_out;

    -- redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo(STALLFIFO,178)
    redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_valid_in <= SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_V0;
    redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_stall_in <= SE_out_redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_backStall;
    redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_data_in <= redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_q;
    redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_valid_in_bitsignaltemp <= redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_valid_in(0);
    redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_stall_in_bitsignaltemp <= redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_stall_in(0);
    redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_valid_out(0) <= redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_valid_out_bitsignaltemp;
    redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_stall_out(0) <= redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_stall_out_bitsignaltemp;
    theredist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 208,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_stall_in_bitsignaltemp,
        data_in => redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_q,
        valid_out => redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_stall_out_bitsignaltemp,
        data_out => redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0(STALLENABLE,307)
    -- Valid signal propagation
    SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_V0 <= SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_R_v_0;
    SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_V1 <= SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_R_v_1;
    -- Stall signal propagation
    SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_s_tv_0 <= redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_stall_out and SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_R_v_0;
    SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_s_tv_1 <= SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_backStall and SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_R_v_1;
    -- Backward Enable generation
    SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_or0 <= SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_s_tv_0;
    SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_backEN <= not (SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_s_tv_1 or SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_v_s_0 <= SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_backEN and SE_out_dense_B1_merge_reg_aunroll_x_V4;
    -- Backward Stall generation
    SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_backStall <= not (SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_v_s_0);
    SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_R_v_0 <= (others => '0');
            SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_backEN = "0") THEN
                SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_R_v_0 <= SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_R_v_0 and SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_s_tv_0;
            ELSE
                SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_R_v_0 <= SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_v_s_0;
            END IF;

            IF (SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_backEN = "0") THEN
                SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_R_v_1 <= SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_R_v_1 and SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_s_tv_1;
            ELSE
                SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_R_v_1 <= SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_3(STALLENABLE,326)
    -- Valid signal propagation
    SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_3_V0 <= SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_3_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_3_backStall <= i_syncbuf_filter_weight_sync_buffer_dense_out_stall_out or not (SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_3_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_3_wireValid <= bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_valid_out;

    -- bubble_out_dense_B1_merge_reg_aunroll_x_3_reg(STALLFIFO,389)
    bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_valid_in <= SE_out_dense_B1_merge_reg_aunroll_x_V2;
    bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_stall_in <= SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_3_backStall;
    bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_valid_in_bitsignaltemp <= bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_valid_in(0);
    bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_stall_in_bitsignaltemp <= bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_stall_in(0);
    bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_valid_out(0) <= bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_valid_out_bitsignaltemp;
    bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_stall_out(0) <= bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_stall_out_bitsignaltemp;
    thebubble_out_dense_B1_merge_reg_aunroll_x_3_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_2(STALLENABLE,324)
    -- Valid signal propagation
    SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_2_V0 <= SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_2_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_2_backStall <= i_syncbuf_input_size_sync_buffer1_dense_out_stall_out or not (SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_2_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_2_wireValid <= bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_valid_out;

    -- bubble_out_dense_B1_merge_reg_aunroll_x_2_reg(STALLFIFO,388)
    bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_valid_in <= SE_out_dense_B1_merge_reg_aunroll_x_V1;
    bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_stall_in <= SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_2_backStall;
    bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_valid_in_bitsignaltemp <= bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_valid_in(0);
    bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_stall_in_bitsignaltemp <= bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_stall_in(0);
    bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_valid_out(0) <= bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_valid_out_bitsignaltemp;
    bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_stall_out(0) <= bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_stall_out_bitsignaltemp;
    thebubble_out_dense_B1_merge_reg_aunroll_x_2_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_input_im_sync_buffer_dense(BLACKBOX,77)@3
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_input_im_sync_buffer_dense : i_syncbuf_input_im_sync_buffer_dense10
    PORT MAP (
        in_buffer_in => in_input_im,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_input_im_sync_buffer_dense_backStall,
        in_valid_in => SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_1_V0,
        out_buffer_out => i_syncbuf_input_im_sync_buffer_dense_out_buffer_out,
        out_stall_out => i_syncbuf_input_im_sync_buffer_dense_out_stall_out,
        out_valid_out => i_syncbuf_input_im_sync_buffer_dense_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_1(STALLENABLE,322)
    -- Valid signal propagation
    SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_1_V0 <= SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_1_backStall <= i_syncbuf_input_im_sync_buffer_dense_out_stall_out or not (SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_1_wireValid <= bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_valid_out;

    -- bubble_out_dense_B1_merge_reg_aunroll_x_1_reg(STALLFIFO,387)
    bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_valid_in <= SE_out_dense_B1_merge_reg_aunroll_x_V0;
    bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_stall_in <= SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_1_backStall;
    bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp <= bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_valid_in(0);
    bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp <= bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_stall_in(0);
    bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_valid_out(0) <= bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp;
    bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_stall_out(0) <= bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp;
    thebubble_out_dense_B1_merge_reg_aunroll_x_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,268)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= dense_B1_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,215)
    bubble_join_stall_entry_q <= in_j_02 & in_global_id_05 & in_arrayidx22 & in_add113;

    -- bubble_select_stall_entry(BITSELECT,216)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 32));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 96));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(159 downto 128));

    -- dense_B1_merge_reg_aunroll_x(BLACKBOX,4)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thedense_B1_merge_reg_aunroll_x : dense_B1_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_b,
        in_data_in_1 => bubble_select_stall_entry_e,
        in_data_in_2 => bubble_select_stall_entry_c,
        in_data_in_3 => bubble_select_stall_entry_d,
        in_stall_in => SE_out_dense_B1_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => dense_B1_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => dense_B1_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => dense_B1_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => dense_B1_merge_reg_aunroll_x_out_data_out_3,
        out_stall_out => dense_B1_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => dense_B1_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_dense_B1_merge_reg_aunroll_x(STALLENABLE,236)
    SE_out_dense_B1_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_dense_B1_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_dense_B1_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_dense_B1_merge_reg_aunroll_x_fromReg2 <= (others => '0');
            SE_out_dense_B1_merge_reg_aunroll_x_fromReg3 <= (others => '0');
            SE_out_dense_B1_merge_reg_aunroll_x_fromReg4 <= (others => '0');
            SE_out_dense_B1_merge_reg_aunroll_x_fromReg5 <= (others => '0');
            SE_out_dense_B1_merge_reg_aunroll_x_fromReg6 <= (others => '0');
            SE_out_dense_B1_merge_reg_aunroll_x_fromReg7 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_dense_B1_merge_reg_aunroll_x_fromReg0 <= SE_out_dense_B1_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_dense_B1_merge_reg_aunroll_x_fromReg1 <= SE_out_dense_B1_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_dense_B1_merge_reg_aunroll_x_fromReg2 <= SE_out_dense_B1_merge_reg_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_dense_B1_merge_reg_aunroll_x_fromReg3 <= SE_out_dense_B1_merge_reg_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_dense_B1_merge_reg_aunroll_x_fromReg4 <= SE_out_dense_B1_merge_reg_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_dense_B1_merge_reg_aunroll_x_fromReg5 <= SE_out_dense_B1_merge_reg_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_dense_B1_merge_reg_aunroll_x_fromReg6 <= SE_out_dense_B1_merge_reg_aunroll_x_toReg6;
            -- Succesor 7
            SE_out_dense_B1_merge_reg_aunroll_x_fromReg7 <= SE_out_dense_B1_merge_reg_aunroll_x_toReg7;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_dense_B1_merge_reg_aunroll_x_consumed0 <= (not (bubble_out_dense_B1_merge_reg_aunroll_x_1_reg_stall_out) and SE_out_dense_B1_merge_reg_aunroll_x_wireValid) or SE_out_dense_B1_merge_reg_aunroll_x_fromReg0;
    SE_out_dense_B1_merge_reg_aunroll_x_consumed1 <= (not (bubble_out_dense_B1_merge_reg_aunroll_x_2_reg_stall_out) and SE_out_dense_B1_merge_reg_aunroll_x_wireValid) or SE_out_dense_B1_merge_reg_aunroll_x_fromReg1;
    SE_out_dense_B1_merge_reg_aunroll_x_consumed2 <= (not (bubble_out_dense_B1_merge_reg_aunroll_x_3_reg_stall_out) and SE_out_dense_B1_merge_reg_aunroll_x_wireValid) or SE_out_dense_B1_merge_reg_aunroll_x_fromReg2;
    SE_out_dense_B1_merge_reg_aunroll_x_consumed3 <= (not (bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_stall_out) and SE_out_dense_B1_merge_reg_aunroll_x_wireValid) or SE_out_dense_B1_merge_reg_aunroll_x_fromReg3;
    SE_out_dense_B1_merge_reg_aunroll_x_consumed4 <= (not (SE_redist4_dense_B1_merge_reg_aunroll_x_out_data_out_1_1_0_backStall) and SE_out_dense_B1_merge_reg_aunroll_x_wireValid) or SE_out_dense_B1_merge_reg_aunroll_x_fromReg4;
    SE_out_dense_B1_merge_reg_aunroll_x_consumed5 <= (not (redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_stall_out) and SE_out_dense_B1_merge_reg_aunroll_x_wireValid) or SE_out_dense_B1_merge_reg_aunroll_x_fromReg5;
    SE_out_dense_B1_merge_reg_aunroll_x_consumed6 <= (not (redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_stall_out) and SE_out_dense_B1_merge_reg_aunroll_x_wireValid) or SE_out_dense_B1_merge_reg_aunroll_x_fromReg6;
    SE_out_dense_B1_merge_reg_aunroll_x_consumed7 <= (not (redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_stall_out) and SE_out_dense_B1_merge_reg_aunroll_x_wireValid) or SE_out_dense_B1_merge_reg_aunroll_x_fromReg7;
    -- Consuming
    SE_out_dense_B1_merge_reg_aunroll_x_StallValid <= SE_out_dense_B1_merge_reg_aunroll_x_backStall and SE_out_dense_B1_merge_reg_aunroll_x_wireValid;
    SE_out_dense_B1_merge_reg_aunroll_x_toReg0 <= SE_out_dense_B1_merge_reg_aunroll_x_StallValid and SE_out_dense_B1_merge_reg_aunroll_x_consumed0;
    SE_out_dense_B1_merge_reg_aunroll_x_toReg1 <= SE_out_dense_B1_merge_reg_aunroll_x_StallValid and SE_out_dense_B1_merge_reg_aunroll_x_consumed1;
    SE_out_dense_B1_merge_reg_aunroll_x_toReg2 <= SE_out_dense_B1_merge_reg_aunroll_x_StallValid and SE_out_dense_B1_merge_reg_aunroll_x_consumed2;
    SE_out_dense_B1_merge_reg_aunroll_x_toReg3 <= SE_out_dense_B1_merge_reg_aunroll_x_StallValid and SE_out_dense_B1_merge_reg_aunroll_x_consumed3;
    SE_out_dense_B1_merge_reg_aunroll_x_toReg4 <= SE_out_dense_B1_merge_reg_aunroll_x_StallValid and SE_out_dense_B1_merge_reg_aunroll_x_consumed4;
    SE_out_dense_B1_merge_reg_aunroll_x_toReg5 <= SE_out_dense_B1_merge_reg_aunroll_x_StallValid and SE_out_dense_B1_merge_reg_aunroll_x_consumed5;
    SE_out_dense_B1_merge_reg_aunroll_x_toReg6 <= SE_out_dense_B1_merge_reg_aunroll_x_StallValid and SE_out_dense_B1_merge_reg_aunroll_x_consumed6;
    SE_out_dense_B1_merge_reg_aunroll_x_toReg7 <= SE_out_dense_B1_merge_reg_aunroll_x_StallValid and SE_out_dense_B1_merge_reg_aunroll_x_consumed7;
    -- Backward Stall generation
    SE_out_dense_B1_merge_reg_aunroll_x_or0 <= SE_out_dense_B1_merge_reg_aunroll_x_consumed0;
    SE_out_dense_B1_merge_reg_aunroll_x_or1 <= SE_out_dense_B1_merge_reg_aunroll_x_consumed1 and SE_out_dense_B1_merge_reg_aunroll_x_or0;
    SE_out_dense_B1_merge_reg_aunroll_x_or2 <= SE_out_dense_B1_merge_reg_aunroll_x_consumed2 and SE_out_dense_B1_merge_reg_aunroll_x_or1;
    SE_out_dense_B1_merge_reg_aunroll_x_or3 <= SE_out_dense_B1_merge_reg_aunroll_x_consumed3 and SE_out_dense_B1_merge_reg_aunroll_x_or2;
    SE_out_dense_B1_merge_reg_aunroll_x_or4 <= SE_out_dense_B1_merge_reg_aunroll_x_consumed4 and SE_out_dense_B1_merge_reg_aunroll_x_or3;
    SE_out_dense_B1_merge_reg_aunroll_x_or5 <= SE_out_dense_B1_merge_reg_aunroll_x_consumed5 and SE_out_dense_B1_merge_reg_aunroll_x_or4;
    SE_out_dense_B1_merge_reg_aunroll_x_or6 <= SE_out_dense_B1_merge_reg_aunroll_x_consumed6 and SE_out_dense_B1_merge_reg_aunroll_x_or5;
    SE_out_dense_B1_merge_reg_aunroll_x_wireStall <= not (SE_out_dense_B1_merge_reg_aunroll_x_consumed7 and SE_out_dense_B1_merge_reg_aunroll_x_or6);
    SE_out_dense_B1_merge_reg_aunroll_x_backStall <= SE_out_dense_B1_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_dense_B1_merge_reg_aunroll_x_V0 <= SE_out_dense_B1_merge_reg_aunroll_x_wireValid and not (SE_out_dense_B1_merge_reg_aunroll_x_fromReg0);
    SE_out_dense_B1_merge_reg_aunroll_x_V1 <= SE_out_dense_B1_merge_reg_aunroll_x_wireValid and not (SE_out_dense_B1_merge_reg_aunroll_x_fromReg1);
    SE_out_dense_B1_merge_reg_aunroll_x_V2 <= SE_out_dense_B1_merge_reg_aunroll_x_wireValid and not (SE_out_dense_B1_merge_reg_aunroll_x_fromReg2);
    SE_out_dense_B1_merge_reg_aunroll_x_V3 <= SE_out_dense_B1_merge_reg_aunroll_x_wireValid and not (SE_out_dense_B1_merge_reg_aunroll_x_fromReg3);
    SE_out_dense_B1_merge_reg_aunroll_x_V4 <= SE_out_dense_B1_merge_reg_aunroll_x_wireValid and not (SE_out_dense_B1_merge_reg_aunroll_x_fromReg4);
    SE_out_dense_B1_merge_reg_aunroll_x_V5 <= SE_out_dense_B1_merge_reg_aunroll_x_wireValid and not (SE_out_dense_B1_merge_reg_aunroll_x_fromReg5);
    SE_out_dense_B1_merge_reg_aunroll_x_V6 <= SE_out_dense_B1_merge_reg_aunroll_x_wireValid and not (SE_out_dense_B1_merge_reg_aunroll_x_fromReg6);
    SE_out_dense_B1_merge_reg_aunroll_x_V7 <= SE_out_dense_B1_merge_reg_aunroll_x_wireValid and not (SE_out_dense_B1_merge_reg_aunroll_x_fromReg7);
    -- Computing multiple Valid(s)
    SE_out_dense_B1_merge_reg_aunroll_x_wireValid <= dense_B1_merge_reg_aunroll_x_out_valid_out;

    -- bubble_out_dense_B1_merge_reg_aunroll_x_4_reg(STALLFIFO,390)
    bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_valid_in <= SE_out_dense_B1_merge_reg_aunroll_x_V3;
    bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_stall_in <= SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_4_backStall;
    bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_valid_in_bitsignaltemp <= bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_valid_in(0);
    bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_stall_in_bitsignaltemp <= bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_stall_in(0);
    bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_valid_out(0) <= bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_valid_out_bitsignaltemp;
    bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_stall_out(0) <= bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_stall_out_bitsignaltemp;
    thebubble_out_dense_B1_merge_reg_aunroll_x_4_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 210,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_4(STALLENABLE,328)
    -- Valid signal propagation
    SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_4_V0 <= SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_4_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_4_backStall <= i_syncbuf_input_size_sync_buffer_dense_out_stall_out or not (SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_4_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_4_wireValid <= bubble_out_dense_B1_merge_reg_aunroll_x_4_reg_valid_out;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_syncbuf_input_size_sync_buffer_dense(BLACKBOX,79)@210
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_input_size_sync_buffer_dense : i_syncbuf_input_size_sync_buffer_dense17
    PORT MAP (
        in_buffer_in => in_input_size,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_input_size_sync_buffer_dense_backStall,
        in_valid_in => SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_4_V0,
        out_buffer_out => i_syncbuf_input_size_sync_buffer_dense_out_buffer_out,
        out_stall_out => i_syncbuf_input_size_sync_buffer_dense_out_stall_out,
        out_valid_out => i_syncbuf_input_size_sync_buffer_dense_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_syncbuf_input_size_sync_buffer_dense(BITJOIN,211)
    bubble_join_i_syncbuf_input_size_sync_buffer_dense_q <= i_syncbuf_input_size_sync_buffer_dense_out_buffer_out;

    -- bubble_select_i_syncbuf_input_size_sync_buffer_dense(BITSELECT,212)
    bubble_select_i_syncbuf_input_size_sync_buffer_dense_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_input_size_sync_buffer_dense_q(31 downto 0));

    -- redist8_bgTrunc_i_inc_dense_sel_x_b_1_0(REG,181)
    redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_backEN = "1") THEN
                redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg(STALLREG,393)
    SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_r_valid <= bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_backStall and (SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_r_valid or SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_i_valid);

            IF (SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_i_valid <= SE_out_i_syncbuf_input_size_sync_buffer_dense_V0;
    -- Stall signal propagation
    SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_backStall <= SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_r_valid or not (SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_V <= SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_r_valid WHEN SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_r_valid = "1" ELSE SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_i_valid;


    -- SE_out_i_syncbuf_input_size_sync_buffer_dense(STALLENABLE,266)
    SE_out_i_syncbuf_input_size_sync_buffer_dense_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_input_size_sync_buffer_dense_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_input_size_sync_buffer_dense_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_input_size_sync_buffer_dense_fromReg0 <= SE_out_i_syncbuf_input_size_sync_buffer_dense_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_input_size_sync_buffer_dense_fromReg1 <= SE_out_i_syncbuf_input_size_sync_buffer_dense_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_input_size_sync_buffer_dense_consumed0 <= (not (SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_backStall) and SE_out_i_syncbuf_input_size_sync_buffer_dense_wireValid) or SE_out_i_syncbuf_input_size_sync_buffer_dense_fromReg0;
    SE_out_i_syncbuf_input_size_sync_buffer_dense_consumed1 <= (not (SR_SE_i_exitcond_dense_backStall) and SE_out_i_syncbuf_input_size_sync_buffer_dense_wireValid) or SE_out_i_syncbuf_input_size_sync_buffer_dense_fromReg1;
    -- Consuming
    SE_out_i_syncbuf_input_size_sync_buffer_dense_StallValid <= SE_out_i_syncbuf_input_size_sync_buffer_dense_backStall and SE_out_i_syncbuf_input_size_sync_buffer_dense_wireValid;
    SE_out_i_syncbuf_input_size_sync_buffer_dense_toReg0 <= SE_out_i_syncbuf_input_size_sync_buffer_dense_StallValid and SE_out_i_syncbuf_input_size_sync_buffer_dense_consumed0;
    SE_out_i_syncbuf_input_size_sync_buffer_dense_toReg1 <= SE_out_i_syncbuf_input_size_sync_buffer_dense_StallValid and SE_out_i_syncbuf_input_size_sync_buffer_dense_consumed1;
    -- Backward Stall generation
    SE_out_i_syncbuf_input_size_sync_buffer_dense_or0 <= SE_out_i_syncbuf_input_size_sync_buffer_dense_consumed0;
    SE_out_i_syncbuf_input_size_sync_buffer_dense_wireStall <= not (SE_out_i_syncbuf_input_size_sync_buffer_dense_consumed1 and SE_out_i_syncbuf_input_size_sync_buffer_dense_or0);
    SE_out_i_syncbuf_input_size_sync_buffer_dense_backStall <= SE_out_i_syncbuf_input_size_sync_buffer_dense_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_input_size_sync_buffer_dense_V0 <= SE_out_i_syncbuf_input_size_sync_buffer_dense_wireValid and not (SE_out_i_syncbuf_input_size_sync_buffer_dense_fromReg0);
    SE_out_i_syncbuf_input_size_sync_buffer_dense_V1 <= SE_out_i_syncbuf_input_size_sync_buffer_dense_wireValid and not (SE_out_i_syncbuf_input_size_sync_buffer_dense_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_input_size_sync_buffer_dense_wireValid <= i_syncbuf_input_size_sync_buffer_dense_out_valid_out;

    -- SR_SE_i_exitcond_dense(STALLREG,395)
    SR_SE_i_exitcond_dense_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_exitcond_dense_r_valid <= (others => '0');
            SR_SE_i_exitcond_dense_r_data0 <= (others => '-');
            SR_SE_i_exitcond_dense_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_exitcond_dense_r_valid <= SE_i_exitcond_dense_backStall and (SR_SE_i_exitcond_dense_r_valid or SR_SE_i_exitcond_dense_i_valid);

            IF (SR_SE_i_exitcond_dense_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_exitcond_dense_r_data0 <= STD_LOGIC_VECTOR(redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_q);
                SR_SE_i_exitcond_dense_r_data1 <= STD_LOGIC_VECTOR(bubble_select_i_syncbuf_input_size_sync_buffer_dense_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_exitcond_dense_and0 <= SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_V0;
    SR_SE_i_exitcond_dense_i_valid <= SE_out_i_syncbuf_input_size_sync_buffer_dense_V1 and SR_SE_i_exitcond_dense_and0;
    -- Stall signal propagation
    SR_SE_i_exitcond_dense_backStall <= SR_SE_i_exitcond_dense_r_valid or not (SR_SE_i_exitcond_dense_i_valid);

    -- Valid
    SR_SE_i_exitcond_dense_V <= SR_SE_i_exitcond_dense_r_valid WHEN SR_SE_i_exitcond_dense_r_valid = "1" ELSE SR_SE_i_exitcond_dense_i_valid;

    -- Data0
    SR_SE_i_exitcond_dense_D0 <= SR_SE_i_exitcond_dense_r_data0 WHEN SR_SE_i_exitcond_dense_r_valid = "1" ELSE redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_q;
    -- Data1
    SR_SE_i_exitcond_dense_D1 <= SR_SE_i_exitcond_dense_r_data1 WHEN SR_SE_i_exitcond_dense_r_valid = "1" ELSE bubble_select_i_syncbuf_input_size_sync_buffer_dense_b;

    -- c_i32_1gr(CONSTANT,57)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- bubble_join_redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo(BITJOIN,225)
    bubble_join_redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_q <= redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_data_out;

    -- bubble_select_redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo(BITSELECT,226)
    bubble_select_redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_q(31 downto 0));

    -- i_inc_dense(ADD,70)@209
    i_inc_dense_a <= STD_LOGIC_VECTOR("0" & bubble_select_redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_b);
    i_inc_dense_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc_dense_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc_dense_a) + UNSIGNED(i_inc_dense_b));
    i_inc_dense_q <= i_inc_dense_o(32 downto 0);

    -- bgTrunc_i_inc_dense_sel_x(BITSELECT,3)@209
    bgTrunc_i_inc_dense_sel_x_b <= i_inc_dense_q(31 downto 0);

    -- SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0(STALLREG,394)
    SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_r_valid <= SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_backStall and (SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_r_valid or SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(bgTrunc_i_inc_dense_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_i_valid <= SE_out_redist5_dense_B1_merge_reg_aunroll_x_out_data_out_1_208_fifo_V0;
    -- Stall signal propagation
    SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_backStall <= SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_r_valid or not (SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_V <= SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_r_valid WHEN SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_i_valid;

    SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_D0 <= SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_r_data0 WHEN SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_r_valid = "1" ELSE bgTrunc_i_inc_dense_sel_x_b;

    -- SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0(STALLENABLE,314)
    -- Valid signal propagation
    SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_V0 <= SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_R_v_0;
    SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_V1 <= SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_R_v_1;
    -- Stall signal propagation
    SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_s_tv_0 <= SR_SE_i_exitcond_dense_backStall and SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_R_v_0;
    SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_s_tv_1 <= SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_backStall and SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_R_v_1;
    -- Backward Enable generation
    SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_or0 <= SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_s_tv_0;
    SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_backEN <= not (SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_s_tv_1 or SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_v_s_0 <= SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_backEN and SR_SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_backStall <= not (SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_backEN);
    SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_R_v_0 <= (others => '0');
            SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_backEN = "0") THEN
                SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_R_v_0 <= SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_R_v_0 and SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_R_v_0 <= SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_backEN = "0") THEN
                SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_R_v_1 <= SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_R_v_1 and SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_s_tv_1;
            ELSE
                SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_R_v_1 <= SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0(STALLENABLE,315)
    -- Valid signal propagation
    SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_V0 <= SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_R_v_0;
    -- Stall signal propagation
    SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_s_tv_0 <= SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_backStall and SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_R_v_0;
    -- Backward Enable generation
    SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_backEN <= not (SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_v_s_0 <= SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_backEN and SE_redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_V1;
    -- Backward Stall generation
    SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_backStall <= not (SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_v_s_0);
    SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_backEN = "0") THEN
                SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_R_v_0 <= SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_R_v_0 and SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_s_tv_0;
            ELSE
                SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_R_v_0 <= SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_exitcond_dense(STALLENABLE,251)
    -- Valid signal propagation
    SE_i_exitcond_dense_V0 <= SE_i_exitcond_dense_R_v_0;
    -- Stall signal propagation
    SE_i_exitcond_dense_s_tv_0 <= SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_backStall and SE_i_exitcond_dense_R_v_0;
    -- Backward Enable generation
    SE_i_exitcond_dense_backEN <= not (SE_i_exitcond_dense_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_exitcond_dense_v_s_0 <= SE_i_exitcond_dense_backEN and SR_SE_i_exitcond_dense_V;
    -- Backward Stall generation
    SE_i_exitcond_dense_backStall <= not (SE_i_exitcond_dense_backEN);
    SE_i_exitcond_dense_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_exitcond_dense_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_exitcond_dense_backEN = "0") THEN
                SE_i_exitcond_dense_R_v_0 <= SE_i_exitcond_dense_R_v_0 and SE_i_exitcond_dense_s_tv_0;
            ELSE
                SE_i_exitcond_dense_R_v_0 <= SE_i_exitcond_dense_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg(STALLENABLE,391)
    -- Valid signal propagation
    bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_V0 <= bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_s_tv_0 <= SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_backStall and bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_backEN <= not (bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_v_s_0 <= bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_backEN and SR_bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_backStall <= not (bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_backEN);
    bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_backEN = "0") THEN
                bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_R_v_0 <= bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_R_v_0 and bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_s_tv_0;
            ELSE
                bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_R_v_0 <= bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo(BITJOIN,222)
    bubble_join_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_q <= redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_data_out;

    -- bubble_select_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo(BITSELECT,223)
    bubble_select_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_q(31 downto 0));

    -- bubble_join_i_load_unnamed_dense4_dense(BITJOIN,199)
    bubble_join_i_load_unnamed_dense4_dense_q <= i_load_unnamed_dense4_dense_out_o_readdata;

    -- bubble_select_i_load_unnamed_dense4_dense(BITSELECT,200)
    bubble_select_i_load_unnamed_dense4_dense_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_dense4_dense_q(31 downto 0));

    -- redist2_i_arrayidx7_dense_dense20_trunc_sel_x_b_1_0(REG,175)
    redist2_i_arrayidx7_dense_dense20_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_arrayidx7_dense_dense20_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist2_i_arrayidx7_dense_dense20_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_D1);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_input_im_sync_buffer_dense(BITJOIN,205)
    bubble_join_i_syncbuf_input_im_sync_buffer_dense_q <= i_syncbuf_input_im_sync_buffer_dense_out_buffer_out;

    -- bubble_select_i_syncbuf_input_im_sync_buffer_dense(BITSELECT,206)
    bubble_select_i_syncbuf_input_im_sync_buffer_dense_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_input_im_sync_buffer_dense_q(63 downto 0));

    -- i_arrayidx7_dense_dense20_add_x(ADD,33)@3
    i_arrayidx7_dense_dense20_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_input_im_sync_buffer_dense_b);
    i_arrayidx7_dense_dense20_add_x_b <= STD_LOGIC_VECTOR("0" & redist2_i_arrayidx7_dense_dense20_trunc_sel_x_b_1_0_q);
    i_arrayidx7_dense_dense20_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx7_dense_dense20_add_x_a) + UNSIGNED(i_arrayidx7_dense_dense20_add_x_b));
    i_arrayidx7_dense_dense20_add_x_q <= i_arrayidx7_dense_dense20_add_x_o(64 downto 0);

    -- i_arrayidx7_dense_dense20_dupName_0_trunc_sel_x(BITSELECT,27)@3
    i_arrayidx7_dense_dense20_dupName_0_trunc_sel_x_b <= i_arrayidx7_dense_dense20_add_x_q(63 downto 0);

    -- i_load_unnamed_dense3_dense(BLACKBOX,71)@3
    -- in in_i_stall@20000000
    -- out out_o_readdata@186
    -- out out_o_stall@20000000
    -- out out_o_valid@186
    -- out out_unnamed_dense3_avm_address@20000000
    -- out out_unnamed_dense3_avm_burstcount@20000000
    -- out out_unnamed_dense3_avm_byteenable@20000000
    -- out out_unnamed_dense3_avm_enable@20000000
    -- out out_unnamed_dense3_avm_read@20000000
    -- out out_unnamed_dense3_avm_write@20000000
    -- out out_unnamed_dense3_avm_writedata@20000000
    thei_load_unnamed_dense3_dense : i_load_unnamed_dense3_dense22
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx7_dense_dense20_dupName_0_trunc_sel_x_b,
        in_i_predicate => i_cmp1_phi_decision5_xor_rm_dense_c,
        in_i_stall => SE_out_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_backStall,
        in_i_valid => SE_out_i_syncbuf_input_im_sync_buffer_dense_V0,
        in_unnamed_dense3_avm_readdata => in_unnamed_dense3_avm_readdata,
        in_unnamed_dense3_avm_readdatavalid => in_unnamed_dense3_avm_readdatavalid,
        in_unnamed_dense3_avm_waitrequest => in_unnamed_dense3_avm_waitrequest,
        in_unnamed_dense3_avm_writeack => in_unnamed_dense3_avm_writeack,
        out_o_readdata => i_load_unnamed_dense3_dense_out_o_readdata,
        out_o_stall => i_load_unnamed_dense3_dense_out_o_stall,
        out_o_valid => i_load_unnamed_dense3_dense_out_o_valid,
        out_unnamed_dense3_avm_address => i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_address,
        out_unnamed_dense3_avm_burstcount => i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_burstcount,
        out_unnamed_dense3_avm_byteenable => i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_byteenable,
        out_unnamed_dense3_avm_enable => i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_enable,
        out_unnamed_dense3_avm_read => i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_read,
        out_unnamed_dense3_avm_write => i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_write,
        out_unnamed_dense3_avm_writedata => i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_load_unnamed_dense3_dense(BITJOIN,196)
    bubble_join_i_load_unnamed_dense3_dense_q <= i_load_unnamed_dense3_dense_out_o_readdata;

    -- bubble_select_i_load_unnamed_dense3_dense(BITSELECT,197)
    bubble_select_i_load_unnamed_dense3_dense_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_dense3_dense_q(31 downto 0));

    -- i_sfc_c0_for_body_dense_c0_enter_dense_aunroll_x(BLACKBOX,53)@186
    -- in in_i_stall@20000000
    -- out out_c0_exit_0@211
    -- out out_c0_exit_1@211
    -- out out_o_stall@20000000
    -- out out_o_valid@211
    thei_sfc_c0_for_body_dense_c0_enter_dense_aunroll_x : i_sfc_c0_for_body_dense_c0_enter_dense
    PORT MAP (
        in_c0_eni3_0 => GND_q,
        in_c0_eni3_1 => bubble_select_i_load_unnamed_dense3_dense_b,
        in_c0_eni3_2 => bubble_select_i_load_unnamed_dense4_dense_b,
        in_c0_eni3_3 => bubble_select_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_b,
        in_i_stall => SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_backStall,
        in_i_valid => SE_out_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_V0,
        out_c0_exit_1 => i_sfc_c0_for_body_dense_c0_enter_dense_aunroll_x_out_c0_exit_1,
        out_o_stall => i_sfc_c0_for_body_dense_c0_enter_dense_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_body_dense_c0_enter_dense_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo(STALLFIFO,179)
    redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_valid_in <= SE_out_dense_B1_merge_reg_aunroll_x_V6;
    redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_stall_in <= SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_backStall;
    redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_data_in <= bubble_select_dense_B1_merge_reg_aunroll_x_d;
    redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_valid_in_bitsignaltemp <= redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_valid_in(0);
    redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_stall_in_bitsignaltemp <= redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_stall_in(0);
    redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_valid_out(0) <= redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_valid_out_bitsignaltemp;
    redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_stall_out(0) <= redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_stall_out_bitsignaltemp;
    theredist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 211,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_valid_in_bitsignaltemp,
        stall_in => redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_dense_B1_merge_reg_aunroll_x_d,
        valid_out => redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_valid_out_bitsignaltemp,
        stall_out => redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_stall_out_bitsignaltemp,
        data_out => redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo(STALLFIFO,180)
    redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_valid_in <= SE_out_dense_B1_merge_reg_aunroll_x_V7;
    redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_stall_in <= SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_backStall;
    redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_data_in <= bubble_select_dense_B1_merge_reg_aunroll_x_e;
    redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_valid_in_bitsignaltemp <= redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_valid_in(0);
    redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_stall_in_bitsignaltemp <= redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_stall_in(0);
    redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_valid_out(0) <= redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_valid_out_bitsignaltemp;
    redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_stall_out(0) <= redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_stall_out_bitsignaltemp;
    theredist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 211,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_valid_in_bitsignaltemp,
        stall_in => redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_dense_B1_merge_reg_aunroll_x_e,
        valid_out => redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_valid_out_bitsignaltemp,
        stall_out => redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_stall_out_bitsignaltemp,
        data_out => redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo(STALLENABLE,313)
    -- Valid signal propagation
    SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_V0 <= SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_backStall <= in_stall_in or not (SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_and0 <= redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_valid_out;
    SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_and1 <= redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_valid_out and SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_and0;
    SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_and2 <= redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_valid_out and SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_and1;
    SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_and3 <= i_sfc_c0_for_body_dense_c0_enter_dense_aunroll_x_out_o_valid and SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_and2;
    SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_and4 <= bubble_out_i_syncbuf_input_size_sync_buffer_dense_1_reg_V0 and SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_and3;
    SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_and5 <= SE_i_exitcond_dense_V0 and SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_and4;
    SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_wireValid <= SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_V0 and SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_and5;

    -- redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo(STALLFIFO,173)
    redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_valid_in <= SE_out_i_syncbuf_input_size_sync_buffer1_dense_V2;
    redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_stall_in <= SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_backStall;
    redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_data_in <= i_cmp1_phi_decision5_xor_rm_dense_c;
    redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_valid_in_bitsignaltemp <= redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_valid_in(0);
    redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_stall_in_bitsignaltemp <= redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_stall_in(0);
    redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_valid_out(0) <= redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_valid_out_bitsignaltemp;
    redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_stall_out(0) <= redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_stall_out_bitsignaltemp;
    theredist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 209,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_stall_in_bitsignaltemp,
        data_in => i_cmp1_phi_decision5_xor_rm_dense_c,
        valid_out => redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_stall_out_bitsignaltemp,
        data_out => redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_input_im_sync_buffer_dense(STALLENABLE,262)
    -- Valid signal propagation
    SE_out_i_syncbuf_input_im_sync_buffer_dense_V0 <= SE_out_i_syncbuf_input_im_sync_buffer_dense_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_input_im_sync_buffer_dense_backStall <= i_load_unnamed_dense3_dense_out_o_stall or not (SE_out_i_syncbuf_input_im_sync_buffer_dense_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_input_im_sync_buffer_dense_and0 <= i_syncbuf_input_im_sync_buffer_dense_out_valid_out;
    SE_out_i_syncbuf_input_im_sync_buffer_dense_and1 <= SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_V1 and SE_out_i_syncbuf_input_im_sync_buffer_dense_and0;
    SE_out_i_syncbuf_input_im_sync_buffer_dense_wireValid <= SE_out_i_syncbuf_input_size_sync_buffer1_dense_V0 and SE_out_i_syncbuf_input_im_sync_buffer_dense_and1;

    -- i_syncbuf_input_size_sync_buffer1_dense(BLACKBOX,78)@3
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_input_size_sync_buffer1_dense : i_syncbuf_input_size_sync_buffer1_dense12
    PORT MAP (
        in_buffer_in => in_input_size,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_input_size_sync_buffer1_dense_backStall,
        in_valid_in => SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_2_V0,
        out_buffer_out => i_syncbuf_input_size_sync_buffer1_dense_out_buffer_out,
        out_stall_out => i_syncbuf_input_size_sync_buffer1_dense_out_stall_out,
        out_valid_out => i_syncbuf_input_size_sync_buffer1_dense_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_input_size_sync_buffer1_dense(STALLENABLE,264)
    SE_out_i_syncbuf_input_size_sync_buffer1_dense_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_input_size_sync_buffer1_dense_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_input_size_sync_buffer1_dense_fromReg1 <= (others => '0');
            SE_out_i_syncbuf_input_size_sync_buffer1_dense_fromReg2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_input_size_sync_buffer1_dense_fromReg0 <= SE_out_i_syncbuf_input_size_sync_buffer1_dense_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_input_size_sync_buffer1_dense_fromReg1 <= SE_out_i_syncbuf_input_size_sync_buffer1_dense_toReg1;
            -- Succesor 2
            SE_out_i_syncbuf_input_size_sync_buffer1_dense_fromReg2 <= SE_out_i_syncbuf_input_size_sync_buffer1_dense_toReg2;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_input_size_sync_buffer1_dense_consumed0 <= (not (SE_out_i_syncbuf_input_im_sync_buffer_dense_backStall) and SE_out_i_syncbuf_input_size_sync_buffer1_dense_wireValid) or SE_out_i_syncbuf_input_size_sync_buffer1_dense_fromReg0;
    SE_out_i_syncbuf_input_size_sync_buffer1_dense_consumed1 <= (not (SE_out_i_syncbuf_filter_weight_sync_buffer_dense_backStall) and SE_out_i_syncbuf_input_size_sync_buffer1_dense_wireValid) or SE_out_i_syncbuf_input_size_sync_buffer1_dense_fromReg1;
    SE_out_i_syncbuf_input_size_sync_buffer1_dense_consumed2 <= (not (redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_stall_out) and SE_out_i_syncbuf_input_size_sync_buffer1_dense_wireValid) or SE_out_i_syncbuf_input_size_sync_buffer1_dense_fromReg2;
    -- Consuming
    SE_out_i_syncbuf_input_size_sync_buffer1_dense_StallValid <= SE_out_i_syncbuf_input_size_sync_buffer1_dense_backStall and SE_out_i_syncbuf_input_size_sync_buffer1_dense_wireValid;
    SE_out_i_syncbuf_input_size_sync_buffer1_dense_toReg0 <= SE_out_i_syncbuf_input_size_sync_buffer1_dense_StallValid and SE_out_i_syncbuf_input_size_sync_buffer1_dense_consumed0;
    SE_out_i_syncbuf_input_size_sync_buffer1_dense_toReg1 <= SE_out_i_syncbuf_input_size_sync_buffer1_dense_StallValid and SE_out_i_syncbuf_input_size_sync_buffer1_dense_consumed1;
    SE_out_i_syncbuf_input_size_sync_buffer1_dense_toReg2 <= SE_out_i_syncbuf_input_size_sync_buffer1_dense_StallValid and SE_out_i_syncbuf_input_size_sync_buffer1_dense_consumed2;
    -- Backward Stall generation
    SE_out_i_syncbuf_input_size_sync_buffer1_dense_or0 <= SE_out_i_syncbuf_input_size_sync_buffer1_dense_consumed0;
    SE_out_i_syncbuf_input_size_sync_buffer1_dense_or1 <= SE_out_i_syncbuf_input_size_sync_buffer1_dense_consumed1 and SE_out_i_syncbuf_input_size_sync_buffer1_dense_or0;
    SE_out_i_syncbuf_input_size_sync_buffer1_dense_wireStall <= not (SE_out_i_syncbuf_input_size_sync_buffer1_dense_consumed2 and SE_out_i_syncbuf_input_size_sync_buffer1_dense_or1);
    SE_out_i_syncbuf_input_size_sync_buffer1_dense_backStall <= SE_out_i_syncbuf_input_size_sync_buffer1_dense_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_input_size_sync_buffer1_dense_V0 <= SE_out_i_syncbuf_input_size_sync_buffer1_dense_wireValid and not (SE_out_i_syncbuf_input_size_sync_buffer1_dense_fromReg0);
    SE_out_i_syncbuf_input_size_sync_buffer1_dense_V1 <= SE_out_i_syncbuf_input_size_sync_buffer1_dense_wireValid and not (SE_out_i_syncbuf_input_size_sync_buffer1_dense_fromReg1);
    SE_out_i_syncbuf_input_size_sync_buffer1_dense_V2 <= SE_out_i_syncbuf_input_size_sync_buffer1_dense_wireValid and not (SE_out_i_syncbuf_input_size_sync_buffer1_dense_fromReg2);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_input_size_sync_buffer1_dense_wireValid <= i_syncbuf_input_size_sync_buffer1_dense_out_valid_out;

    -- SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0(STALLENABLE,303)
    -- Valid signal propagation
    SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_V0 <= SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_R_v_0;
    SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_V1 <= SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_R_v_1;
    -- Stall signal propagation
    SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_s_tv_0 <= SE_out_i_syncbuf_filter_weight_sync_buffer_dense_backStall and SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_R_v_0;
    SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_s_tv_1 <= SE_out_i_syncbuf_input_im_sync_buffer_dense_backStall and SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_R_v_1;
    -- Backward Enable generation
    SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_or0 <= SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_s_tv_0;
    SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_backEN <= not (SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_s_tv_1 or SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_v_s_0 <= SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_backEN and SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_backStall <= not (SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_backEN);
    SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
            SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_R_v_0 <= SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_R_v_0 and SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_R_v_0 <= SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_R_v_1 <= SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_R_v_1 and SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_s_tv_1;
            ELSE
                SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_R_v_1 <= SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- i_syncbuf_filter_weight_sync_buffer_dense(BLACKBOX,76)@3
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_filter_weight_sync_buffer_dense : i_syncbuf_filter_weight_sync_buffer_dense15
    PORT MAP (
        in_buffer_in => in_filter_weight,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_filter_weight_sync_buffer_dense_backStall,
        in_valid_in => SE_out_bubble_out_dense_B1_merge_reg_aunroll_x_3_V0,
        out_buffer_out => i_syncbuf_filter_weight_sync_buffer_dense_out_buffer_out,
        out_stall_out => i_syncbuf_filter_weight_sync_buffer_dense_out_stall_out,
        out_valid_out => i_syncbuf_filter_weight_sync_buffer_dense_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_filter_weight_sync_buffer_dense(STALLENABLE,260)
    -- Valid signal propagation
    SE_out_i_syncbuf_filter_weight_sync_buffer_dense_V0 <= SE_out_i_syncbuf_filter_weight_sync_buffer_dense_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_filter_weight_sync_buffer_dense_backStall <= i_load_unnamed_dense4_dense_out_o_stall or not (SE_out_i_syncbuf_filter_weight_sync_buffer_dense_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_filter_weight_sync_buffer_dense_and0 <= i_syncbuf_filter_weight_sync_buffer_dense_out_valid_out;
    SE_out_i_syncbuf_filter_weight_sync_buffer_dense_and1 <= SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_V0 and SE_out_i_syncbuf_filter_weight_sync_buffer_dense_and0;
    SE_out_i_syncbuf_filter_weight_sync_buffer_dense_wireValid <= SE_out_i_syncbuf_input_size_sync_buffer1_dense_V1 and SE_out_i_syncbuf_filter_weight_sync_buffer_dense_and1;

    -- SE_out_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo(STALLENABLE,306)
    -- Valid signal propagation
    SE_out_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_V0 <= SE_out_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_backStall <= i_sfc_c0_for_body_dense_c0_enter_dense_aunroll_x_out_o_stall or not (SE_out_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_and0 <= redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_valid_out;
    SE_out_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_and1 <= i_load_unnamed_dense4_dense_out_o_valid and SE_out_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_and0;
    SE_out_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_wireValid <= i_load_unnamed_dense3_dense_out_o_valid and SE_out_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_and1;

    -- bubble_join_i_syncbuf_input_size_sync_buffer1_dense(BITJOIN,208)
    bubble_join_i_syncbuf_input_size_sync_buffer1_dense_q <= i_syncbuf_input_size_sync_buffer1_dense_out_buffer_out;

    -- bubble_select_i_syncbuf_input_size_sync_buffer1_dense(BITSELECT,209)
    bubble_select_i_syncbuf_input_size_sync_buffer1_dense_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_input_size_sync_buffer1_dense_q(31 downto 0));

    -- i_cmp1_phi_decision5_xor_rm_dense(COMPARE,64)@3
    i_cmp1_phi_decision5_xor_rm_dense_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => bubble_select_i_syncbuf_input_size_sync_buffer1_dense_b(31)) & bubble_select_i_syncbuf_input_size_sync_buffer1_dense_b));
    i_cmp1_phi_decision5_xor_rm_dense_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_cmp1_phi_decision5_xor_rm_dense_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp1_phi_decision5_xor_rm_dense_a) - SIGNED(i_cmp1_phi_decision5_xor_rm_dense_b));
    i_cmp1_phi_decision5_xor_rm_dense_c(0) <= i_cmp1_phi_decision5_xor_rm_dense_o(33);

    -- redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0(REG,174)
    redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_filter_weight_sync_buffer_dense(BITJOIN,202)
    bubble_join_i_syncbuf_filter_weight_sync_buffer_dense_q <= i_syncbuf_filter_weight_sync_buffer_dense_out_buffer_out;

    -- bubble_select_i_syncbuf_filter_weight_sync_buffer_dense(BITSELECT,203)
    bubble_select_i_syncbuf_filter_weight_sync_buffer_dense_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_filter_weight_sync_buffer_dense_q(63 downto 0));

    -- i_arrayidx9_dense_dense25_add_x(ADD,43)@3
    i_arrayidx9_dense_dense25_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_filter_weight_sync_buffer_dense_b);
    i_arrayidx9_dense_dense25_add_x_b <= STD_LOGIC_VECTOR("0" & redist1_i_arrayidx9_dense_dense25_trunc_sel_x_b_1_0_q);
    i_arrayidx9_dense_dense25_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx9_dense_dense25_add_x_a) + UNSIGNED(i_arrayidx9_dense_dense25_add_x_b));
    i_arrayidx9_dense_dense25_add_x_q <= i_arrayidx9_dense_dense25_add_x_o(64 downto 0);

    -- i_arrayidx9_dense_dense25_dupName_0_trunc_sel_x(BITSELECT,37)@3
    i_arrayidx9_dense_dense25_dupName_0_trunc_sel_x_b <= i_arrayidx9_dense_dense25_add_x_q(63 downto 0);

    -- i_load_unnamed_dense4_dense(BLACKBOX,72)@3
    -- in in_i_stall@20000000
    -- out out_o_readdata@186
    -- out out_o_stall@20000000
    -- out out_o_valid@186
    -- out out_unnamed_dense4_avm_address@20000000
    -- out out_unnamed_dense4_avm_burstcount@20000000
    -- out out_unnamed_dense4_avm_byteenable@20000000
    -- out out_unnamed_dense4_avm_enable@20000000
    -- out out_unnamed_dense4_avm_read@20000000
    -- out out_unnamed_dense4_avm_write@20000000
    -- out out_unnamed_dense4_avm_writedata@20000000
    thei_load_unnamed_dense4_dense : i_load_unnamed_dense4_dense26
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx9_dense_dense25_dupName_0_trunc_sel_x_b,
        in_i_predicate => i_cmp1_phi_decision5_xor_rm_dense_c,
        in_i_stall => SE_out_redist3_dense_B1_merge_reg_aunroll_x_out_data_out_0_185_fifo_backStall,
        in_i_valid => SE_out_i_syncbuf_filter_weight_sync_buffer_dense_V0,
        in_unnamed_dense4_avm_readdata => in_unnamed_dense4_avm_readdata,
        in_unnamed_dense4_avm_readdatavalid => in_unnamed_dense4_avm_readdatavalid,
        in_unnamed_dense4_avm_waitrequest => in_unnamed_dense4_avm_waitrequest,
        in_unnamed_dense4_avm_writeack => in_unnamed_dense4_avm_writeack,
        out_o_readdata => i_load_unnamed_dense4_dense_out_o_readdata,
        out_o_stall => i_load_unnamed_dense4_dense_out_o_stall,
        out_o_valid => i_load_unnamed_dense4_dense_out_o_valid,
        out_unnamed_dense4_avm_address => i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_address,
        out_unnamed_dense4_avm_burstcount => i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_burstcount,
        out_unnamed_dense4_avm_byteenable => i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_byteenable,
        out_unnamed_dense4_avm_enable => i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_enable,
        out_unnamed_dense4_avm_read => i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_read,
        out_unnamed_dense4_avm_write => i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_write,
        out_unnamed_dense4_avm_writedata => i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,6)
    out_unnamed_dense4_avm_address <= i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_address;
    out_unnamed_dense4_avm_enable <= i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_enable;
    out_unnamed_dense4_avm_read <= i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_read;
    out_unnamed_dense4_avm_write <= i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_write;
    out_unnamed_dense4_avm_writedata <= i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_writedata;
    out_unnamed_dense4_avm_byteenable <= i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_byteenable;
    out_unnamed_dense4_avm_burstcount <= i_load_unnamed_dense4_dense_out_unnamed_dense4_avm_burstcount;

    -- i_exitcond_dense(LOGICAL,65)@210 + 1
    i_exitcond_dense_qi <= "1" WHEN SR_SE_i_exitcond_dense_D0 = SR_SE_i_exitcond_dense_D1 ELSE "0";
    i_exitcond_dense_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond_dense_qi, xout => i_exitcond_dense_q, ena => SE_i_exitcond_dense_backEN(0), clk => clock, aclr => resetn );

    -- i_unnamed_dense24(LOGICAL,80)@211
    i_unnamed_dense24_q <= i_exitcond_dense_q or bubble_select_redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_b;

    -- redist9_bgTrunc_i_inc_dense_sel_x_b_2_0(REG,182)
    redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_backEN = "1") THEN
                redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_q <= STD_LOGIC_VECTOR(redist8_bgTrunc_i_inc_dense_sel_x_b_1_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo(BITJOIN,231)
    bubble_join_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_q <= redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_data_out;

    -- bubble_select_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo(BITSELECT,232)
    bubble_select_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_q(31 downto 0));

    -- bubble_join_redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo(BITJOIN,219)
    bubble_join_redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_q <= redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_data_out;

    -- bubble_select_redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo(BITSELECT,220)
    bubble_select_redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_q(0 downto 0));

    -- bubble_join_i_sfc_c0_for_body_dense_c0_enter_dense_aunroll_x(BITJOIN,192)
    bubble_join_i_sfc_c0_for_body_dense_c0_enter_dense_aunroll_x_q <= i_sfc_c0_for_body_dense_c0_enter_dense_aunroll_x_out_c0_exit_1;

    -- bubble_select_i_sfc_c0_for_body_dense_c0_enter_dense_aunroll_x(BITSELECT,193)
    bubble_select_i_sfc_c0_for_body_dense_c0_enter_dense_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body_dense_c0_enter_dense_aunroll_x_q(31 downto 0));

    -- bubble_join_redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo(BITJOIN,228)
    bubble_join_redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_q <= redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_data_out;

    -- bubble_select_redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo(BITSELECT,229)
    bubble_select_redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_q(63 downto 0));

    -- dupName_0_sync_out_x(GPOUT,12)@211
    out_arrayidx22 <= bubble_select_redist6_dense_B1_merge_reg_aunroll_x_out_data_out_2_210_fifo_b;
    out_c0_exe1 <= bubble_select_i_sfc_c0_for_body_dense_c0_enter_dense_aunroll_x_b;
    out_cmp1_phi_decision5_xor_RM <= bubble_select_redist0_i_cmp1_phi_decision5_xor_rm_dense_c_208_fifo_b;
    out_global_id_05 <= bubble_select_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_b;
    out_inc <= redist9_bgTrunc_i_inc_dense_sel_x_b_2_0_q;
    out_unnamed_dense2 <= i_unnamed_dense24_q;
    out_valid_out <= SE_out_redist7_dense_B1_merge_reg_aunroll_x_out_data_out_3_210_fifo_V0;

    -- ext_sig_sync_out(GPOUT,62)
    out_unnamed_dense3_avm_address <= i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_address;
    out_unnamed_dense3_avm_enable <= i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_enable;
    out_unnamed_dense3_avm_read <= i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_read;
    out_unnamed_dense3_avm_write <= i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_write;
    out_unnamed_dense3_avm_writedata <= i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_writedata;
    out_unnamed_dense3_avm_byteenable <= i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_byteenable;
    out_unnamed_dense3_avm_burstcount <= i_load_unnamed_dense3_dense_out_unnamed_dense3_avm_burstcount;

    -- sync_out(GPOUT,92)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
