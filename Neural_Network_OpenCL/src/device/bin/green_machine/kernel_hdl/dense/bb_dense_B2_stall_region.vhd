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

-- VHDL created from bb_dense_B2_stall_region
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

entity bb_dense_B2_stall_region is
    port (
        in_lsu_unnamed_dense5_streset_stream_reset : in std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_dense5_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_arrayidx21 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe14 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_cmp1_phi_decision5_xor_RM3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense5_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_dense5_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_lsu_unnamed_dense5_sts_stream_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_dense5_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_dense5_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense5_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense5_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense5_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_dense5_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_dense5_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_dense_B2_stall_region;

architecture normal of bb_dense_B2_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_store_unnamed_dense5_dense31 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(31 downto 0);  -- Floating Point
            in_lsu_unnamed_dense5_streset_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_dense5_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stream_base_addr : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_dense5_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_dense5_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense5_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal i_store_unnamed_dense5_dense_out_lsu_unnamed_dense5_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_dense5_dense_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_dense5_dense_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (96 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_dense5_dense_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_dense5_dense_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_dense5_dense_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,26)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= i_store_unnamed_dense5_dense_out_o_stall or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- SE_out_i_store_unnamed_dense5_dense(STALLENABLE,25)
    -- Valid signal propagation
    SE_out_i_store_unnamed_dense5_dense_V0 <= SE_out_i_store_unnamed_dense5_dense_wireValid;
    -- Backward Stall generation
    SE_out_i_store_unnamed_dense5_dense_backStall <= in_stall_in or not (SE_out_i_store_unnamed_dense5_dense_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_store_unnamed_dense5_dense_wireValid <= i_store_unnamed_dense5_dense_out_o_valid;

    -- bubble_join_stall_entry(BITJOIN,21)
    bubble_join_stall_entry_q <= in_cmp1_phi_decision5_xor_RM3 & in_c0_exe14 & in_arrayidx21;

    -- bubble_select_stall_entry(BITSELECT,22)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 64));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(96 downto 96));

    -- i_store_unnamed_dense5_dense(BLACKBOX,11)@0
    -- in in_i_stall@20000000
    -- out out_lsu_unnamed_dense5_o_active@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@1
    -- out out_unnamed_dense5_avm_address@20000000
    -- out out_unnamed_dense5_avm_burstcount@20000000
    -- out out_unnamed_dense5_avm_byteenable@20000000
    -- out out_unnamed_dense5_avm_enable@20000000
    -- out out_unnamed_dense5_avm_read@20000000
    -- out out_unnamed_dense5_avm_write@20000000
    -- out out_unnamed_dense5_avm_writedata@20000000
    thei_store_unnamed_dense5_dense : i_store_unnamed_dense5_dense31
    PORT MAP (
        in_flush => in_flush,
        in_i_address => bubble_select_stall_entry_b,
        in_i_predicate => bubble_select_stall_entry_d,
        in_i_stall => SE_out_i_store_unnamed_dense5_dense_backStall,
        in_i_valid => SE_stall_entry_V0,
        in_i_writedata => bubble_select_stall_entry_c,
        in_lsu_unnamed_dense5_streset_stream_reset => in_lsu_unnamed_dense5_streset_stream_reset,
        in_lsu_unnamed_dense5_sts_stream_size => in_lsu_unnamed_dense5_sts_stream_size,
        in_stream_base_addr => bubble_select_stall_entry_b,
        in_unnamed_dense5_avm_readdata => in_unnamed_dense5_avm_readdata,
        in_unnamed_dense5_avm_readdatavalid => in_unnamed_dense5_avm_readdatavalid,
        in_unnamed_dense5_avm_waitrequest => in_unnamed_dense5_avm_waitrequest,
        in_unnamed_dense5_avm_writeack => in_unnamed_dense5_avm_writeack,
        out_lsu_unnamed_dense5_o_active => i_store_unnamed_dense5_dense_out_lsu_unnamed_dense5_o_active,
        out_o_stall => i_store_unnamed_dense5_dense_out_o_stall,
        out_o_valid => i_store_unnamed_dense5_dense_out_o_valid,
        out_unnamed_dense5_avm_address => i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_address,
        out_unnamed_dense5_avm_burstcount => i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_burstcount,
        out_unnamed_dense5_avm_byteenable => i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_byteenable,
        out_unnamed_dense5_avm_enable => i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_enable,
        out_unnamed_dense5_avm_read => i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_read,
        out_unnamed_dense5_avm_write => i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_write,
        out_unnamed_dense5_avm_writedata => i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,3)
    out_lsu_unnamed_dense5_o_active <= i_store_unnamed_dense5_dense_out_lsu_unnamed_dense5_o_active;

    -- dupName_0_sync_out_x(GPOUT,5)@1
    out_valid_out <= SE_out_i_store_unnamed_dense5_dense_V0;

    -- ext_sig_sync_out(GPOUT,10)
    out_unnamed_dense5_avm_address <= i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_address;
    out_unnamed_dense5_avm_enable <= i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_enable;
    out_unnamed_dense5_avm_read <= i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_read;
    out_unnamed_dense5_avm_write <= i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_write;
    out_unnamed_dense5_avm_writedata <= i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_writedata;
    out_unnamed_dense5_avm_byteenable <= i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_byteenable;
    out_unnamed_dense5_avm_burstcount <= i_store_unnamed_dense5_dense_out_unnamed_dense5_avm_burstcount;

    -- sync_out(GPOUT,18)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
