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

-- VHDL created from bb_dense_B0_stall_region
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

entity bb_dense_B0_stall_region is
    port (
        in_lsu_unnamed_dense0_streset_stream_reset : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense1_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_dense1_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense1_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense1_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense1_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_dense1_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_dense1_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_arrayidx2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_global_id_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_dense0 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_dense0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_dense1_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_dense1_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_dense1_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_lsu_unnamed_dense0_sts_stream_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_dense0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_dense0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_dense0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_dense0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_filter_bias : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_dense_B0_stall_region;

architecture normal of bb_dense_B0_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component dense_B0_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_dense0_dense3 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_dense0_streset_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_dense0_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stream_base_addr : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_dense0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_dense0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_dense0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_dense0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_unnamed_dense1_dense8 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_dense1_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense1_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_dense1_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense1_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_dense1_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_dense1_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_dense1_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense1_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense1_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense1_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_filter_bias_sync_buffer_dense0 is
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


    component i_syncbuf_output_im_sync_buffer_dense5 is
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




    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B0_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_B0_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B0_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx2_dense_dense7_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx2_dense_dense7_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx2_dense_dense7_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx2_dense_dense7_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx2_dense_dense7_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx2_dense_dense7_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx2_dense_dense7_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_dense_dense2_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_dense_dense2_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx_dense_dense2_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_dense_dense2_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_dense_dense2_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_dense_dense2_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_dense_dense2_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom_dense_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_unnamed_dense0_dense_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_dense0_dense_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_dense0_dense_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_store_unnamed_dense1_dense_out_lsu_unnamed_dense1_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_dense1_dense_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_dense1_dense_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_syncbuf_filter_bias_sync_buffer_dense_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_filter_bias_sync_buffer_dense_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_filter_bias_sync_buffer_dense_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_output_im_sync_buffer_dense_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_output_im_sync_buffer_dense_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_output_im_sync_buffer_dense_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_dense_dense2_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx2_dense_dense7_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_i_arrayidx2_dense_dense7_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_dense_B0_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_dense_B0_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_dense0_dense_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_dense0_dense_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_filter_bias_sync_buffer_dense_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_filter_bias_sync_buffer_dense_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_syncbuf_output_im_sync_buffer_dense_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_output_im_sync_buffer_dense_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_dense_B0_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B0_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B0_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B0_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B0_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B0_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B0_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B0_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B0_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B0_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B0_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B0_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_dense_B0_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_dense0_dense_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_dense0_dense_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_dense0_dense_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_dense0_dense_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_dense0_dense_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_dense0_dense_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_dense0_dense_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_dense0_dense_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_dense0_dense_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_dense0_dense_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_dense0_dense_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_dense0_dense_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_dense0_dense_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_store_unnamed_dense1_dense_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_store_unnamed_dense1_dense_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_store_unnamed_dense1_dense_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_store_unnamed_dense1_dense_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_bias_sync_buffer_dense_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_bias_sync_buffer_dense_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_bias_sync_buffer_dense_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_bias_sync_buffer_dense_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_dense_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_dense_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_dense_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_dense_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_s_tv_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_D0 : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- i_syncbuf_output_im_sync_buffer_dense(BLACKBOX,51)@2
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_output_im_sync_buffer_dense : i_syncbuf_output_im_sync_buffer_dense5
    PORT MAP (
        in_buffer_in => in_output_im,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_output_im_sync_buffer_dense_backStall,
        in_valid_in => SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_V3,
        out_buffer_out => i_syncbuf_output_im_sync_buffer_dense_out_buffer_out,
        out_stall_out => i_syncbuf_output_im_sync_buffer_dense_out_stall_out,
        out_valid_out => i_syncbuf_output_im_sync_buffer_dense_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx2_dense_dense7_mult_multconst_x(CONSTANT,24)
    i_arrayidx2_dense_dense7_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- SE_stall_entry(STALLENABLE,166)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= dense_B0_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,135)
    bubble_join_stall_entry_q <= in_global_id_0;

    -- bubble_select_stall_entry(BITSELECT,136)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));

    -- dense_B0_merge_reg_aunroll_x(BLACKBOX,2)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thedense_B0_merge_reg_aunroll_x : dense_B0_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_b,
        in_stall_in => SE_out_dense_B0_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => dense_B0_merge_reg_aunroll_x_out_data_out_0,
        out_stall_out => dense_B0_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => dense_B0_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_dense_B0_merge_reg_aunroll_x(BITJOIN,120)
    bubble_join_dense_B0_merge_reg_aunroll_x_q <= dense_B0_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_dense_B0_merge_reg_aunroll_x(BITSELECT,121)
    bubble_select_dense_B0_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_dense_B0_merge_reg_aunroll_x_q(31 downto 0));

    -- i_idxprom_dense_sel_x(BITSELECT,40)@1
    i_idxprom_dense_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(bubble_select_dense_B0_merge_reg_aunroll_x_b(31 downto 0)), 64)));

    -- i_arrayidx2_dense_dense7_mult_x_bs1_merged_bit_select(BITSELECT,105)@1
    i_arrayidx2_dense_dense7_mult_x_bs1_merged_bit_select_b <= i_idxprom_dense_sel_x_b(17 downto 0);
    i_arrayidx2_dense_dense7_mult_x_bs1_merged_bit_select_c <= i_idxprom_dense_sel_x_b(63 downto 54);
    i_arrayidx2_dense_dense7_mult_x_bs1_merged_bit_select_d <= i_idxprom_dense_sel_x_b(35 downto 18);
    i_arrayidx2_dense_dense7_mult_x_bs1_merged_bit_select_e <= i_idxprom_dense_sel_x_b(53 downto 36);

    -- i_arrayidx2_dense_dense7_mult_x_im3_shift0(BITSHIFT,98)@1
    i_arrayidx2_dense_dense7_mult_x_im3_shift0_qint <= i_arrayidx2_dense_dense7_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx2_dense_dense7_mult_x_im3_shift0_q <= i_arrayidx2_dense_dense7_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx2_dense_dense7_mult_x_align_15(BITSHIFT,75)@1
    i_arrayidx2_dense_dense7_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx2_dense_dense7_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx2_dense_dense7_mult_x_align_15_q <= i_arrayidx2_dense_dense7_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx2_dense_dense7_mult_x_im6_shift0(BITSHIFT,99)@1
    i_arrayidx2_dense_dense7_mult_x_im6_shift0_qint <= i_arrayidx2_dense_dense7_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx2_dense_dense7_mult_x_im6_shift0_q <= i_arrayidx2_dense_dense7_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx2_dense_dense7_mult_x_align_14(BITSHIFT,74)@1
    i_arrayidx2_dense_dense7_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx2_dense_dense7_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx2_dense_dense7_mult_x_align_14_q <= i_arrayidx2_dense_dense7_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx2_dense_dense7_mult_x_join_16(BITJOIN,76)@1
    i_arrayidx2_dense_dense7_mult_x_join_16_q <= i_arrayidx2_dense_dense7_mult_x_align_15_q & i_arrayidx2_dense_dense7_mult_x_align_14_q;

    -- i_arrayidx2_dense_dense7_mult_x_im9_shift0(BITSHIFT,100)@1
    i_arrayidx2_dense_dense7_mult_x_im9_shift0_qint <= i_arrayidx2_dense_dense7_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx2_dense_dense7_mult_x_im9_shift0_q <= i_arrayidx2_dense_dense7_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx2_dense_dense7_mult_x_align_12(BITSHIFT,72)@1
    i_arrayidx2_dense_dense7_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx2_dense_dense7_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx2_dense_dense7_mult_x_align_12_q <= i_arrayidx2_dense_dense7_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx2_dense_dense7_mult_x_im0_shift0(BITSHIFT,97)@1
    i_arrayidx2_dense_dense7_mult_x_im0_shift0_qint <= i_arrayidx2_dense_dense7_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx2_dense_dense7_mult_x_im0_shift0_q <= i_arrayidx2_dense_dense7_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx2_dense_dense7_mult_x_join_13(BITJOIN,73)@1
    i_arrayidx2_dense_dense7_mult_x_join_13_q <= i_arrayidx2_dense_dense7_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx2_dense_dense7_mult_x_im0_shift0_q);

    -- i_arrayidx2_dense_dense7_mult_x_result_add_0_0(ADD,77)@1
    i_arrayidx2_dense_dense7_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx2_dense_dense7_mult_x_join_13_q);
    i_arrayidx2_dense_dense7_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx2_dense_dense7_mult_x_join_16_q);
    i_arrayidx2_dense_dense7_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx2_dense_dense7_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx2_dense_dense7_mult_x_result_add_0_0_b));
    i_arrayidx2_dense_dense7_mult_x_result_add_0_0_q <= i_arrayidx2_dense_dense7_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx2_dense_dense7_mult_extender_x(BITJOIN,23)@1
    i_arrayidx2_dense_dense7_mult_extender_x_q <= i_arrayidx2_dense_dense7_mult_multconst_x_q & i_arrayidx2_dense_dense7_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx2_dense_dense7_trunc_sel_x(BITSELECT,25)@1
    i_arrayidx2_dense_dense7_trunc_sel_x_b <= i_arrayidx2_dense_dense7_mult_extender_x_q(63 downto 0);

    -- redist2_i_arrayidx2_dense_dense7_trunc_sel_x_b_1_0(REG,114)
    redist2_i_arrayidx2_dense_dense7_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_arrayidx2_dense_dense7_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist2_i_arrayidx2_dense_dense7_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(i_arrayidx2_dense_dense7_trunc_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_output_im_sync_buffer_dense(BITJOIN,132)
    bubble_join_i_syncbuf_output_im_sync_buffer_dense_q <= i_syncbuf_output_im_sync_buffer_dense_out_buffer_out;

    -- bubble_select_i_syncbuf_output_im_sync_buffer_dense(BITSELECT,133)
    bubble_select_i_syncbuf_output_im_sync_buffer_dense_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_output_im_sync_buffer_dense_q(63 downto 0));

    -- i_arrayidx2_dense_dense7_add_x(ADD,26)@2
    i_arrayidx2_dense_dense7_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_output_im_sync_buffer_dense_b);
    i_arrayidx2_dense_dense7_add_x_b <= STD_LOGIC_VECTOR("0" & redist2_i_arrayidx2_dense_dense7_trunc_sel_x_b_1_0_q);
    i_arrayidx2_dense_dense7_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx2_dense_dense7_add_x_a) + UNSIGNED(i_arrayidx2_dense_dense7_add_x_b));
    i_arrayidx2_dense_dense7_add_x_q <= i_arrayidx2_dense_dense7_add_x_o(64 downto 0);

    -- i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x(BITSELECT,20)@2
    i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b <= i_arrayidx2_dense_dense7_add_x_q(63 downto 0);

    -- redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo(STALLFIFO,117)
    redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_valid_in <= SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_V1;
    redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_stall_in <= SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_backStall;
    redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_data_in <= redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_q;
    redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_valid_in_bitsignaltemp <= redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_valid_in(0);
    redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_stall_in_bitsignaltemp <= redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_stall_in(0);
    redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_valid_out(0) <= redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_valid_out_bitsignaltemp;
    redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_stall_out(0) <= redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_stall_out_bitsignaltemp;
    theredist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 95,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_stall_in_bitsignaltemp,
        data_in => redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_q,
        valid_out => redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_stall_out_bitsignaltemp,
        data_out => redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1(STALLENABLE,194)
    -- Valid signal propagation
    SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_V0 <= SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_R_v_0;
    SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_V1 <= SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_R_v_1;
    -- Stall signal propagation
    SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_s_tv_0 <= SE_in_i_store_unnamed_dense1_dense_backStall and SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_R_v_0;
    SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_s_tv_1 <= redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_stall_out and SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_R_v_1;
    -- Backward Enable generation
    SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_or0 <= SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_s_tv_0;
    SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_backEN <= not (SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_s_tv_1 or SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_v_s_0 <= SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_backEN and SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_V0;
    -- Backward Stall generation
    SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_backStall <= not (SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_v_s_0);
    SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_R_v_0 <= (others => '0');
            SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_backEN = "0") THEN
                SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_R_v_0 <= SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_R_v_0 and SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_s_tv_0;
            ELSE
                SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_R_v_0 <= SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_v_s_0;
            END IF;

            IF (SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_backEN = "0") THEN
                SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_R_v_1 <= SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_R_v_1 and SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_s_tv_1;
            ELSE
                SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_R_v_1 <= SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0(STALLENABLE,193)
    -- Valid signal propagation
    SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_V0 <= SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_R_v_0;
    -- Stall signal propagation
    SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_s_tv_0 <= SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_backStall and SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_R_v_0;
    -- Backward Enable generation
    SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_backEN <= not (SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_v_s_0 <= SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_backEN and SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_V;
    -- Backward Stall generation
    SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_backStall <= not (SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_backEN);
    SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_backEN = "0") THEN
                SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_R_v_0 <= SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_R_v_0 and SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_s_tv_0;
            ELSE
                SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_R_v_0 <= SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0(STALLREG,241)
    SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_r_valid <= (others => '0');
            SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_r_valid <= SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_backStall and (SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_r_valid or SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_i_valid);

            IF (SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_r_data0 <= STD_LOGIC_VECTOR(i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_i_valid <= SE_out_i_syncbuf_output_im_sync_buffer_dense_V0;
    -- Stall signal propagation
    SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_backStall <= SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_r_valid or not (SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_i_valid);

    -- Valid
    SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_V <= SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_r_valid WHEN SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_r_valid = "1" ELSE SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_i_valid;

    SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_D0 <= SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_r_data0 WHEN SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_r_valid = "1" ELSE i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b;

    -- SE_out_i_syncbuf_output_im_sync_buffer_dense(STALLENABLE,165)
    -- Valid signal propagation
    SE_out_i_syncbuf_output_im_sync_buffer_dense_V0 <= SE_out_i_syncbuf_output_im_sync_buffer_dense_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_output_im_sync_buffer_dense_backStall <= SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_backStall or not (SE_out_i_syncbuf_output_im_sync_buffer_dense_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_output_im_sync_buffer_dense_and0 <= i_syncbuf_output_im_sync_buffer_dense_out_valid_out;
    SE_out_i_syncbuf_output_im_sync_buffer_dense_wireValid <= SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_V1 and SE_out_i_syncbuf_output_im_sync_buffer_dense_and0;

    -- redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo(STALLFIFO,118)
    redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_valid_in <= SE_out_dense_B0_merge_reg_aunroll_x_V0;
    redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_stall_in <= SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_backStall;
    redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_data_in <= bubble_select_dense_B0_merge_reg_aunroll_x_b;
    redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_valid_in_bitsignaltemp <= redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_valid_in(0);
    redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_stall_in_bitsignaltemp <= redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_stall_in(0);
    redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_valid_out(0) <= redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_valid_out_bitsignaltemp;
    redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_stall_out(0) <= redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_stall_out_bitsignaltemp;
    theredist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 98,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_dense_B0_merge_reg_aunroll_x_b,
        valid_out => redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_stall_out_bitsignaltemp,
        data_out => redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_dense_B0_merge_reg_aunroll_x(STALLENABLE,148)
    SE_out_dense_B0_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_dense_B0_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_dense_B0_merge_reg_aunroll_x_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_dense_B0_merge_reg_aunroll_x_fromReg0 <= SE_out_dense_B0_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_dense_B0_merge_reg_aunroll_x_fromReg1 <= SE_out_dense_B0_merge_reg_aunroll_x_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_dense_B0_merge_reg_aunroll_x_consumed0 <= (not (redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_stall_out) and SE_out_dense_B0_merge_reg_aunroll_x_wireValid) or SE_out_dense_B0_merge_reg_aunroll_x_fromReg0;
    SE_out_dense_B0_merge_reg_aunroll_x_consumed1 <= (not (SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_backStall) and SE_out_dense_B0_merge_reg_aunroll_x_wireValid) or SE_out_dense_B0_merge_reg_aunroll_x_fromReg1;
    -- Consuming
    SE_out_dense_B0_merge_reg_aunroll_x_StallValid <= SE_out_dense_B0_merge_reg_aunroll_x_backStall and SE_out_dense_B0_merge_reg_aunroll_x_wireValid;
    SE_out_dense_B0_merge_reg_aunroll_x_toReg0 <= SE_out_dense_B0_merge_reg_aunroll_x_StallValid and SE_out_dense_B0_merge_reg_aunroll_x_consumed0;
    SE_out_dense_B0_merge_reg_aunroll_x_toReg1 <= SE_out_dense_B0_merge_reg_aunroll_x_StallValid and SE_out_dense_B0_merge_reg_aunroll_x_consumed1;
    -- Backward Stall generation
    SE_out_dense_B0_merge_reg_aunroll_x_or0 <= SE_out_dense_B0_merge_reg_aunroll_x_consumed0;
    SE_out_dense_B0_merge_reg_aunroll_x_wireStall <= not (SE_out_dense_B0_merge_reg_aunroll_x_consumed1 and SE_out_dense_B0_merge_reg_aunroll_x_or0);
    SE_out_dense_B0_merge_reg_aunroll_x_backStall <= SE_out_dense_B0_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_dense_B0_merge_reg_aunroll_x_V0 <= SE_out_dense_B0_merge_reg_aunroll_x_wireValid and not (SE_out_dense_B0_merge_reg_aunroll_x_fromReg0);
    SE_out_dense_B0_merge_reg_aunroll_x_V1 <= SE_out_dense_B0_merge_reg_aunroll_x_wireValid and not (SE_out_dense_B0_merge_reg_aunroll_x_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_dense_B0_merge_reg_aunroll_x_wireValid <= dense_B0_merge_reg_aunroll_x_out_valid_out;

    -- SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0(STALLENABLE,191)
    -- Valid signal propagation
    SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_V0 <= SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_0;
    SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_V1 <= SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_1;
    SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_V2 <= SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_2;
    SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_V3 <= SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_3;
    -- Stall signal propagation
    SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_s_tv_0 <= SE_out_i_syncbuf_filter_bias_sync_buffer_dense_backStall and SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_0;
    SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_s_tv_1 <= SE_out_i_syncbuf_output_im_sync_buffer_dense_backStall and SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_1;
    SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_s_tv_2 <= i_syncbuf_filter_bias_sync_buffer_dense_out_stall_out and SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_2;
    SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_s_tv_3 <= i_syncbuf_output_im_sync_buffer_dense_out_stall_out and SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_3;
    -- Backward Enable generation
    SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_or0 <= SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_s_tv_0;
    SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_or1 <= SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_s_tv_1 or SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_or0;
    SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_or2 <= SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_s_tv_2 or SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_or1;
    SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_backEN <= not (SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_s_tv_3 or SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_or2);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_v_s_0 <= SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_backEN and SE_out_dense_B0_merge_reg_aunroll_x_V1;
    -- Backward Stall generation
    SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_backStall <= not (SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_v_s_0);
    SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
            SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_1 <= (others => '0');
            SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_2 <= (others => '0');
            SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_3 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_0 <= SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_0 and SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_0 <= SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_1 <= SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_1 and SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_s_tv_1;
            ELSE
                SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_1 <= SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_2 <= SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_2 and SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_s_tv_2;
            ELSE
                SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_2 <= SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_3 <= SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_3 and SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_s_tv_3;
            ELSE
                SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_R_v_3 <= SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- i_syncbuf_filter_bias_sync_buffer_dense(BLACKBOX,50)@2
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_filter_bias_sync_buffer_dense : i_syncbuf_filter_bias_sync_buffer_dense0
    PORT MAP (
        in_buffer_in => in_filter_bias,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_filter_bias_sync_buffer_dense_backStall,
        in_valid_in => SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_V2,
        out_buffer_out => i_syncbuf_filter_bias_sync_buffer_dense_out_buffer_out,
        out_stall_out => i_syncbuf_filter_bias_sync_buffer_dense_out_stall_out,
        out_valid_out => i_syncbuf_filter_bias_sync_buffer_dense_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_filter_bias_sync_buffer_dense(STALLENABLE,163)
    -- Valid signal propagation
    SE_out_i_syncbuf_filter_bias_sync_buffer_dense_V0 <= SE_out_i_syncbuf_filter_bias_sync_buffer_dense_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_filter_bias_sync_buffer_dense_backStall <= i_load_unnamed_dense0_dense_out_o_stall or not (SE_out_i_syncbuf_filter_bias_sync_buffer_dense_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_filter_bias_sync_buffer_dense_and0 <= i_syncbuf_filter_bias_sync_buffer_dense_out_valid_out;
    SE_out_i_syncbuf_filter_bias_sync_buffer_dense_wireValid <= SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_V0 and SE_out_i_syncbuf_filter_bias_sync_buffer_dense_and0;

    -- redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo(STALLFIFO,112)
    redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_valid_in <= SE_out_i_load_unnamed_dense0_dense_V1;
    redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_stall_in <= SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_backStall;
    redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_data_in <= bubble_select_i_load_unnamed_dense0_dense_b;
    redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_valid_in_bitsignaltemp <= redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_valid_in(0);
    redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_stall_in_bitsignaltemp <= redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_stall_in(0);
    redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_valid_out(0) <= redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_valid_out_bitsignaltemp;
    redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_stall_out(0) <= redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_stall_out_bitsignaltemp;
    theredist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 95,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_load_unnamed_dense0_dense_b,
        valid_out => redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_stall_out_bitsignaltemp,
        data_out => redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_load_unnamed_dense0_dense(STALLENABLE,159)
    SE_out_i_load_unnamed_dense0_dense_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_load_unnamed_dense0_dense_fromReg0 <= (others => '0');
            SE_out_i_load_unnamed_dense0_dense_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_load_unnamed_dense0_dense_fromReg0 <= SE_out_i_load_unnamed_dense0_dense_toReg0;
            -- Succesor 1
            SE_out_i_load_unnamed_dense0_dense_fromReg1 <= SE_out_i_load_unnamed_dense0_dense_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_load_unnamed_dense0_dense_consumed0 <= (not (SE_in_i_store_unnamed_dense1_dense_backStall) and SE_out_i_load_unnamed_dense0_dense_wireValid) or SE_out_i_load_unnamed_dense0_dense_fromReg0;
    SE_out_i_load_unnamed_dense0_dense_consumed1 <= (not (redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_stall_out) and SE_out_i_load_unnamed_dense0_dense_wireValid) or SE_out_i_load_unnamed_dense0_dense_fromReg1;
    -- Consuming
    SE_out_i_load_unnamed_dense0_dense_StallValid <= SE_out_i_load_unnamed_dense0_dense_backStall and SE_out_i_load_unnamed_dense0_dense_wireValid;
    SE_out_i_load_unnamed_dense0_dense_toReg0 <= SE_out_i_load_unnamed_dense0_dense_StallValid and SE_out_i_load_unnamed_dense0_dense_consumed0;
    SE_out_i_load_unnamed_dense0_dense_toReg1 <= SE_out_i_load_unnamed_dense0_dense_StallValid and SE_out_i_load_unnamed_dense0_dense_consumed1;
    -- Backward Stall generation
    SE_out_i_load_unnamed_dense0_dense_or0 <= SE_out_i_load_unnamed_dense0_dense_consumed0;
    SE_out_i_load_unnamed_dense0_dense_wireStall <= not (SE_out_i_load_unnamed_dense0_dense_consumed1 and SE_out_i_load_unnamed_dense0_dense_or0);
    SE_out_i_load_unnamed_dense0_dense_backStall <= SE_out_i_load_unnamed_dense0_dense_wireStall;
    -- Valid signal propagation
    SE_out_i_load_unnamed_dense0_dense_V0 <= SE_out_i_load_unnamed_dense0_dense_wireValid and not (SE_out_i_load_unnamed_dense0_dense_fromReg0);
    SE_out_i_load_unnamed_dense0_dense_V1 <= SE_out_i_load_unnamed_dense0_dense_wireValid and not (SE_out_i_load_unnamed_dense0_dense_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_load_unnamed_dense0_dense_wireValid <= i_load_unnamed_dense0_dense_out_o_valid;

    -- i_arrayidx_dense_dense2_mult_x_im3_shift0(BITSHIFT,102)@1
    i_arrayidx_dense_dense2_mult_x_im3_shift0_qint <= i_arrayidx2_dense_dense7_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx_dense_dense2_mult_x_im3_shift0_q <= i_arrayidx_dense_dense2_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx_dense_dense2_mult_x_align_15(BITSHIFT,93)@1
    i_arrayidx_dense_dense2_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_dense_dense2_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx_dense_dense2_mult_x_align_15_q <= i_arrayidx_dense_dense2_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx_dense_dense2_mult_x_im6_shift0(BITSHIFT,103)@1
    i_arrayidx_dense_dense2_mult_x_im6_shift0_qint <= i_arrayidx2_dense_dense7_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx_dense_dense2_mult_x_im6_shift0_q <= i_arrayidx_dense_dense2_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx_dense_dense2_mult_x_align_14(BITSHIFT,92)@1
    i_arrayidx_dense_dense2_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_dense_dense2_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx_dense_dense2_mult_x_align_14_q <= i_arrayidx_dense_dense2_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx_dense_dense2_mult_x_join_16(BITJOIN,94)@1
    i_arrayidx_dense_dense2_mult_x_join_16_q <= i_arrayidx_dense_dense2_mult_x_align_15_q & i_arrayidx_dense_dense2_mult_x_align_14_q;

    -- i_arrayidx_dense_dense2_mult_x_im9_shift0(BITSHIFT,104)@1
    i_arrayidx_dense_dense2_mult_x_im9_shift0_qint <= i_arrayidx2_dense_dense7_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx_dense_dense2_mult_x_im9_shift0_q <= i_arrayidx_dense_dense2_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx_dense_dense2_mult_x_align_12(BITSHIFT,90)@1
    i_arrayidx_dense_dense2_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_dense_dense2_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx_dense_dense2_mult_x_align_12_q <= i_arrayidx_dense_dense2_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx_dense_dense2_mult_x_im0_shift0(BITSHIFT,101)@1
    i_arrayidx_dense_dense2_mult_x_im0_shift0_qint <= i_arrayidx2_dense_dense7_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx_dense_dense2_mult_x_im0_shift0_q <= i_arrayidx_dense_dense2_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx_dense_dense2_mult_x_join_13(BITJOIN,91)@1
    i_arrayidx_dense_dense2_mult_x_join_13_q <= i_arrayidx_dense_dense2_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx_dense_dense2_mult_x_im0_shift0_q);

    -- i_arrayidx_dense_dense2_mult_x_result_add_0_0(ADD,95)@1
    i_arrayidx_dense_dense2_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx_dense_dense2_mult_x_join_13_q);
    i_arrayidx_dense_dense2_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx_dense_dense2_mult_x_join_16_q);
    i_arrayidx_dense_dense2_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx_dense_dense2_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx_dense_dense2_mult_x_result_add_0_0_b));
    i_arrayidx_dense_dense2_mult_x_result_add_0_0_q <= i_arrayidx_dense_dense2_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx_dense_dense2_mult_extender_x(BITJOIN,33)@1
    i_arrayidx_dense_dense2_mult_extender_x_q <= i_arrayidx2_dense_dense7_mult_multconst_x_q & i_arrayidx_dense_dense2_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx_dense_dense2_trunc_sel_x(BITSELECT,35)@1
    i_arrayidx_dense_dense2_trunc_sel_x_b <= i_arrayidx_dense_dense2_mult_extender_x_q(63 downto 0);

    -- redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0(REG,113)
    redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(i_arrayidx_dense_dense2_trunc_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_filter_bias_sync_buffer_dense(BITJOIN,129)
    bubble_join_i_syncbuf_filter_bias_sync_buffer_dense_q <= i_syncbuf_filter_bias_sync_buffer_dense_out_buffer_out;

    -- bubble_select_i_syncbuf_filter_bias_sync_buffer_dense(BITSELECT,130)
    bubble_select_i_syncbuf_filter_bias_sync_buffer_dense_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_filter_bias_sync_buffer_dense_q(63 downto 0));

    -- i_arrayidx_dense_dense2_add_x(ADD,36)@2
    i_arrayidx_dense_dense2_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_filter_bias_sync_buffer_dense_b);
    i_arrayidx_dense_dense2_add_x_b <= STD_LOGIC_VECTOR("0" & redist1_i_arrayidx_dense_dense2_trunc_sel_x_b_1_0_q);
    i_arrayidx_dense_dense2_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx_dense_dense2_add_x_a) + UNSIGNED(i_arrayidx_dense_dense2_add_x_b));
    i_arrayidx_dense_dense2_add_x_q <= i_arrayidx_dense_dense2_add_x_o(64 downto 0);

    -- i_arrayidx_dense_dense2_dupName_0_trunc_sel_x(BITSELECT,30)@2
    i_arrayidx_dense_dense2_dupName_0_trunc_sel_x_b <= i_arrayidx_dense_dense2_add_x_q(63 downto 0);

    -- i_load_unnamed_dense0_dense(BLACKBOX,48)@2
    -- in in_i_stall@20000000
    -- out out_o_readdata@4
    -- out out_o_stall@20000000
    -- out out_o_valid@4
    -- out out_unnamed_dense0_avm_address@20000000
    -- out out_unnamed_dense0_avm_burstcount@20000000
    -- out out_unnamed_dense0_avm_byteenable@20000000
    -- out out_unnamed_dense0_avm_enable@20000000
    -- out out_unnamed_dense0_avm_read@20000000
    -- out out_unnamed_dense0_avm_write@20000000
    -- out out_unnamed_dense0_avm_writedata@20000000
    thei_load_unnamed_dense0_dense : i_load_unnamed_dense0_dense3
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx_dense_dense2_dupName_0_trunc_sel_x_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_load_unnamed_dense0_dense_backStall,
        in_i_valid => SE_out_i_syncbuf_filter_bias_sync_buffer_dense_V0,
        in_lsu_unnamed_dense0_streset_stream_reset => in_lsu_unnamed_dense0_streset_stream_reset,
        in_lsu_unnamed_dense0_sts_stream_size => in_lsu_unnamed_dense0_sts_stream_size,
        in_stream_base_addr => i_arrayidx_dense_dense2_dupName_0_trunc_sel_x_b,
        in_unnamed_dense0_avm_readdata => in_unnamed_dense0_avm_readdata,
        in_unnamed_dense0_avm_readdatavalid => in_unnamed_dense0_avm_readdatavalid,
        in_unnamed_dense0_avm_waitrequest => in_unnamed_dense0_avm_waitrequest,
        in_unnamed_dense0_avm_writeack => in_unnamed_dense0_avm_writeack,
        out_o_readdata => i_load_unnamed_dense0_dense_out_o_readdata,
        out_o_stall => i_load_unnamed_dense0_dense_out_o_stall,
        out_o_valid => i_load_unnamed_dense0_dense_out_o_valid,
        out_unnamed_dense0_avm_address => i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_address,
        out_unnamed_dense0_avm_burstcount => i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_burstcount,
        out_unnamed_dense0_avm_byteenable => i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_byteenable,
        out_unnamed_dense0_avm_enable => i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_enable,
        out_unnamed_dense0_avm_read => i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_read,
        out_unnamed_dense0_avm_write => i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_write,
        out_unnamed_dense0_avm_writedata => i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_load_unnamed_dense0_dense(BITJOIN,125)
    bubble_join_i_load_unnamed_dense0_dense_q <= i_load_unnamed_dense0_dense_out_o_readdata;

    -- bubble_select_i_load_unnamed_dense0_dense(BITSELECT,126)
    bubble_select_i_load_unnamed_dense0_dense_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_dense0_dense_q(31 downto 0));

    -- SE_in_i_store_unnamed_dense1_dense(STALLENABLE,160)
    -- Valid signal propagation
    SE_in_i_store_unnamed_dense1_dense_V0 <= SE_in_i_store_unnamed_dense1_dense_wireValid;
    -- Backward Stall generation
    SE_in_i_store_unnamed_dense1_dense_backStall <= i_store_unnamed_dense1_dense_out_o_stall or not (SE_in_i_store_unnamed_dense1_dense_wireValid);
    -- Computing multiple Valid(s)
    SE_in_i_store_unnamed_dense1_dense_and0 <= SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_V0;
    SE_in_i_store_unnamed_dense1_dense_wireValid <= SE_out_i_load_unnamed_dense0_dense_V0 and SE_in_i_store_unnamed_dense1_dense_and0;

    -- SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo(STALLENABLE,198)
    -- Valid signal propagation
    SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_V0 <= SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_backStall <= in_stall_in or not (SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_and0 <= redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_valid_out;
    SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_and1 <= redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_valid_out and SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_and0;
    SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_and2 <= redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_valid_out and SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_and1;
    SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_wireValid <= i_store_unnamed_dense1_dense_out_o_valid and SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_and2;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0(REG,115)
    redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_backEN = "1") THEN
                redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_q <= STD_LOGIC_VECTOR(SR_SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1(REG,116)
    redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_backEN = "1") THEN
                redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_q <= STD_LOGIC_VECTOR(redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- i_store_unnamed_dense1_dense(BLACKBOX,49)@4
    -- in in_i_stall@20000000
    -- out out_lsu_unnamed_dense1_o_active@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@98
    -- out out_unnamed_dense1_avm_address@20000000
    -- out out_unnamed_dense1_avm_burstcount@20000000
    -- out out_unnamed_dense1_avm_byteenable@20000000
    -- out out_unnamed_dense1_avm_enable@20000000
    -- out out_unnamed_dense1_avm_read@20000000
    -- out out_unnamed_dense1_avm_write@20000000
    -- out out_unnamed_dense1_avm_writedata@20000000
    thei_store_unnamed_dense1_dense : i_store_unnamed_dense1_dense8
    PORT MAP (
        in_flush => in_flush,
        in_i_address => redist3_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_2_1_q,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_backStall,
        in_i_valid => SE_in_i_store_unnamed_dense1_dense_V0,
        in_i_writedata => bubble_select_i_load_unnamed_dense0_dense_b,
        in_unnamed_dense1_avm_readdata => in_unnamed_dense1_avm_readdata,
        in_unnamed_dense1_avm_readdatavalid => in_unnamed_dense1_avm_readdatavalid,
        in_unnamed_dense1_avm_waitrequest => in_unnamed_dense1_avm_waitrequest,
        in_unnamed_dense1_avm_writeack => in_unnamed_dense1_avm_writeack,
        out_lsu_unnamed_dense1_o_active => i_store_unnamed_dense1_dense_out_lsu_unnamed_dense1_o_active,
        out_o_stall => i_store_unnamed_dense1_dense_out_o_stall,
        out_o_valid => i_store_unnamed_dense1_dense_out_o_valid,
        out_unnamed_dense1_avm_address => i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_address,
        out_unnamed_dense1_avm_burstcount => i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_burstcount,
        out_unnamed_dense1_avm_byteenable => i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_byteenable,
        out_unnamed_dense1_avm_enable => i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_enable,
        out_unnamed_dense1_avm_read => i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_read,
        out_unnamed_dense1_avm_write => i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_write,
        out_unnamed_dense1_avm_writedata => i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,4)
    out_unnamed_dense1_avm_address <= i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_address;
    out_unnamed_dense1_avm_enable <= i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_enable;
    out_unnamed_dense1_avm_read <= i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_read;
    out_unnamed_dense1_avm_write <= i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_write;
    out_unnamed_dense1_avm_writedata <= i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_writedata;
    out_unnamed_dense1_avm_byteenable <= i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_byteenable;
    out_unnamed_dense1_avm_burstcount <= i_store_unnamed_dense1_dense_out_unnamed_dense1_avm_burstcount;

    -- bubble_join_redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo(BITJOIN,139)
    bubble_join_redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_q <= redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_data_out;

    -- bubble_select_redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo(BITSELECT,140)
    bubble_select_redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_q(31 downto 0));

    -- bubble_join_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo(BITJOIN,145)
    bubble_join_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_q <= redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_data_out;

    -- bubble_select_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo(BITSELECT,146)
    bubble_select_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_q(31 downto 0));

    -- bubble_join_redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo(BITJOIN,142)
    bubble_join_redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_q <= redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_data_out;

    -- bubble_select_redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo(BITSELECT,143)
    bubble_select_redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_q(63 downto 0));

    -- dupName_0_sync_out_x(GPOUT,9)@98
    out_arrayidx2 <= bubble_select_redist4_i_arrayidx2_dense_dense7_dupName_0_trunc_sel_x_b_96_fifo_b;
    out_global_id_0 <= bubble_select_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_b;
    out_unnamed_dense0 <= bubble_select_redist0_i_load_unnamed_dense0_dense_out_o_readdata_94_fifo_b;
    out_valid_out <= SE_out_redist5_dense_B0_merge_reg_aunroll_x_out_data_out_0_97_fifo_V0;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,11)
    out_lsu_unnamed_dense1_o_active <= i_store_unnamed_dense1_dense_out_lsu_unnamed_dense1_o_active;

    -- ext_sig_sync_out(GPOUT,45)
    out_unnamed_dense0_avm_address <= i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_address;
    out_unnamed_dense0_avm_enable <= i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_enable;
    out_unnamed_dense0_avm_read <= i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_read;
    out_unnamed_dense0_avm_write <= i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_write;
    out_unnamed_dense0_avm_writedata <= i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_writedata;
    out_unnamed_dense0_avm_byteenable <= i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_byteenable;
    out_unnamed_dense0_avm_burstcount <= i_load_unnamed_dense0_dense_out_unnamed_dense0_avm_burstcount;

    -- sync_out(GPOUT,59)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
