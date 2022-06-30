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

-- VHDL created from bb_dense_B2
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

entity bb_dense_B2 is
    port (
        in_arrayidx21_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe14_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_cmp1_phi_decision5_xor_RM3_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_lsu_unnamed_dense5_sts_stream_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stream_reset : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense5_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_dense5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense5_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_dense5_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense5_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_dense5_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_dense5_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_dense5_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense5_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense5_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense5_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_dense_B2;

architecture normal of bb_dense_B2 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_dense_B2_stall_region is
        port (
            in_arrayidx21 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe14 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_cmp1_phi_decision5_xor_RM3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_dense5_streset_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_dense5_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense5_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_dense5_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
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


    component dense_B2_branch is
        port (
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component dense_B2_merge is
        port (
            in_arrayidx21_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe14_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_cmp1_phi_decision5_xor_RM3_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_arrayidx21 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe14 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_cmp1_phi_decision5_xor_RM3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_dense_B2_stall_region_out_lsu_unnamed_dense5_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B2_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B2_stall_region_out_unnamed_dense5_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_dense_B2_stall_region_out_unnamed_dense5_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_dense_B2_stall_region_out_unnamed_dense5_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B2_stall_region_out_unnamed_dense5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B2_stall_region_out_unnamed_dense5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B2_stall_region_out_unnamed_dense5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B2_stall_region_out_unnamed_dense5_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_dense_B2_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B2_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B2_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B2_merge_out_arrayidx21 : STD_LOGIC_VECTOR (63 downto 0);
    signal dense_B2_merge_out_c0_exe14 : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_B2_merge_out_cmp1_phi_decision5_xor_RM3 : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B2_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B2_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- dense_B2_branch(BLACKBOX,3)
    thedense_B2_branch : dense_B2_branch
    PORT MAP (
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_dense_B2_stall_region_out_valid_out,
        out_stall_out => dense_B2_branch_out_stall_out,
        out_valid_out_0 => dense_B2_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- dense_B2_merge(BLACKBOX,4)
    thedense_B2_merge : dense_B2_merge
    PORT MAP (
        in_arrayidx21_0 => in_arrayidx21_0,
        in_c0_exe14_0 => in_c0_exe14_0,
        in_cmp1_phi_decision5_xor_RM3_0 => in_cmp1_phi_decision5_xor_RM3_0,
        in_stall_in => bb_dense_B2_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_arrayidx21 => dense_B2_merge_out_arrayidx21,
        out_c0_exe14 => dense_B2_merge_out_c0_exe14,
        out_cmp1_phi_decision5_xor_RM3 => dense_B2_merge_out_cmp1_phi_decision5_xor_RM3,
        out_stall_out_0 => dense_B2_merge_out_stall_out_0,
        out_valid_out => dense_B2_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_dense_B2_stall_region(BLACKBOX,2)
    thebb_dense_B2_stall_region : bb_dense_B2_stall_region
    PORT MAP (
        in_arrayidx21 => dense_B2_merge_out_arrayidx21,
        in_c0_exe14 => dense_B2_merge_out_c0_exe14,
        in_cmp1_phi_decision5_xor_RM3 => dense_B2_merge_out_cmp1_phi_decision5_xor_RM3,
        in_flush => in_flush,
        in_lsu_unnamed_dense5_streset_stream_reset => in_stream_reset,
        in_lsu_unnamed_dense5_sts_stream_size => in_lsu_unnamed_dense5_sts_stream_size,
        in_stall_in => dense_B2_branch_out_stall_out,
        in_unnamed_dense5_avm_readdata => in_unnamed_dense5_avm_readdata,
        in_unnamed_dense5_avm_readdatavalid => in_unnamed_dense5_avm_readdatavalid,
        in_unnamed_dense5_avm_waitrequest => in_unnamed_dense5_avm_waitrequest,
        in_unnamed_dense5_avm_writeack => in_unnamed_dense5_avm_writeack,
        in_valid_in => dense_B2_merge_out_valid_out,
        out_lsu_unnamed_dense5_o_active => bb_dense_B2_stall_region_out_lsu_unnamed_dense5_o_active,
        out_stall_out => bb_dense_B2_stall_region_out_stall_out,
        out_unnamed_dense5_avm_address => bb_dense_B2_stall_region_out_unnamed_dense5_avm_address,
        out_unnamed_dense5_avm_burstcount => bb_dense_B2_stall_region_out_unnamed_dense5_avm_burstcount,
        out_unnamed_dense5_avm_byteenable => bb_dense_B2_stall_region_out_unnamed_dense5_avm_byteenable,
        out_unnamed_dense5_avm_enable => bb_dense_B2_stall_region_out_unnamed_dense5_avm_enable,
        out_unnamed_dense5_avm_read => bb_dense_B2_stall_region_out_unnamed_dense5_avm_read,
        out_unnamed_dense5_avm_write => bb_dense_B2_stall_region_out_unnamed_dense5_avm_write,
        out_unnamed_dense5_avm_writedata => bb_dense_B2_stall_region_out_unnamed_dense5_avm_writedata,
        out_valid_out => bb_dense_B2_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- out_lsu_unnamed_dense5_o_active(GPOUT,17)
    out_lsu_unnamed_dense5_o_active <= bb_dense_B2_stall_region_out_lsu_unnamed_dense5_o_active;

    -- out_stall_out_0(GPOUT,18)
    out_stall_out_0 <= dense_B2_merge_out_stall_out_0;

    -- out_unnamed_dense5_avm_address(GPOUT,19)
    out_unnamed_dense5_avm_address <= bb_dense_B2_stall_region_out_unnamed_dense5_avm_address;

    -- out_unnamed_dense5_avm_burstcount(GPOUT,20)
    out_unnamed_dense5_avm_burstcount <= bb_dense_B2_stall_region_out_unnamed_dense5_avm_burstcount;

    -- out_unnamed_dense5_avm_byteenable(GPOUT,21)
    out_unnamed_dense5_avm_byteenable <= bb_dense_B2_stall_region_out_unnamed_dense5_avm_byteenable;

    -- out_unnamed_dense5_avm_enable(GPOUT,22)
    out_unnamed_dense5_avm_enable <= bb_dense_B2_stall_region_out_unnamed_dense5_avm_enable;

    -- out_unnamed_dense5_avm_read(GPOUT,23)
    out_unnamed_dense5_avm_read <= bb_dense_B2_stall_region_out_unnamed_dense5_avm_read;

    -- out_unnamed_dense5_avm_write(GPOUT,24)
    out_unnamed_dense5_avm_write <= bb_dense_B2_stall_region_out_unnamed_dense5_avm_write;

    -- out_unnamed_dense5_avm_writedata(GPOUT,25)
    out_unnamed_dense5_avm_writedata <= bb_dense_B2_stall_region_out_unnamed_dense5_avm_writedata;

    -- out_valid_out_0(GPOUT,26)
    out_valid_out_0 <= dense_B2_branch_out_valid_out_0;

END normal;
