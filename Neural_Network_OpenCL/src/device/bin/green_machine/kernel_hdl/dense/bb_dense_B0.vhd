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

-- VHDL created from bb_dense_B0
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

entity bb_dense_B0 is
    port (
        in_filter_bias : in std_logic_vector(63 downto 0);  -- ufix64
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_lsu_unnamed_dense0_sts_stream_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stream_reset : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_dense0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense1_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_dense1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense1_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_arrayidx2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_global_id_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_lsu_unnamed_dense1_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_dense0 : out std_logic_vector(31 downto 0);  -- float32_m23
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
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_dense_B0;

architecture normal of bb_dense_B0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_dense_B0_stall_region is
        port (
            in_filter_bias : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lsu_unnamed_dense0_streset_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_dense0_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense1_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense1_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_arrayidx2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_global_id_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_lsu_unnamed_dense1_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component dense_B0_branch is
        port (
            in_arrayidx2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_arrayidx2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_global_id_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense0 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component dense_B0_merge is
        port (
            in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_global_id_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_dense_B0_stall_region_out_arrayidx2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_dense_B0_stall_region_out_global_id_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B0_stall_region_out_lsu_unnamed_dense1_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B0_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B0_stall_region_out_unnamed_dense0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B0_stall_region_out_unnamed_dense0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_dense_B0_stall_region_out_unnamed_dense0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_dense_B0_stall_region_out_unnamed_dense0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B0_stall_region_out_unnamed_dense0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B0_stall_region_out_unnamed_dense0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B0_stall_region_out_unnamed_dense0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B0_stall_region_out_unnamed_dense0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_dense_B0_stall_region_out_unnamed_dense1_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_dense_B0_stall_region_out_unnamed_dense1_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_dense_B0_stall_region_out_unnamed_dense1_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B0_stall_region_out_unnamed_dense1_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B0_stall_region_out_unnamed_dense1_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B0_stall_region_out_unnamed_dense1_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B0_stall_region_out_unnamed_dense1_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_dense_B0_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B0_branch_out_arrayidx2 : STD_LOGIC_VECTOR (63 downto 0);
    signal dense_B0_branch_out_global_id_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_B0_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B0_branch_out_unnamed_dense0 : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_B0_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B0_merge_out_global_id_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_B0_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B0_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- dense_B0_merge(BLACKBOX,4)
    thedense_B0_merge : dense_B0_merge
    PORT MAP (
        in_global_id_0_0 => in_global_id_0_0,
        in_stall_in => bb_dense_B0_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_global_id_0 => dense_B0_merge_out_global_id_0,
        out_stall_out_0 => dense_B0_merge_out_stall_out_0,
        out_valid_out => dense_B0_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_dense_B0_stall_region(BLACKBOX,2)
    thebb_dense_B0_stall_region : bb_dense_B0_stall_region
    PORT MAP (
        in_filter_bias => in_filter_bias,
        in_flush => in_flush,
        in_global_id_0 => dense_B0_merge_out_global_id_0,
        in_lsu_unnamed_dense0_streset_stream_reset => in_stream_reset,
        in_lsu_unnamed_dense0_sts_stream_size => in_lsu_unnamed_dense0_sts_stream_size,
        in_output_im => in_output_im,
        in_stall_in => dense_B0_branch_out_stall_out,
        in_unnamed_dense0_avm_readdata => in_unnamed_dense0_avm_readdata,
        in_unnamed_dense0_avm_readdatavalid => in_unnamed_dense0_avm_readdatavalid,
        in_unnamed_dense0_avm_waitrequest => in_unnamed_dense0_avm_waitrequest,
        in_unnamed_dense0_avm_writeack => in_unnamed_dense0_avm_writeack,
        in_unnamed_dense1_avm_readdata => in_unnamed_dense1_avm_readdata,
        in_unnamed_dense1_avm_readdatavalid => in_unnamed_dense1_avm_readdatavalid,
        in_unnamed_dense1_avm_waitrequest => in_unnamed_dense1_avm_waitrequest,
        in_unnamed_dense1_avm_writeack => in_unnamed_dense1_avm_writeack,
        in_valid_in => dense_B0_merge_out_valid_out,
        out_arrayidx2 => bb_dense_B0_stall_region_out_arrayidx2,
        out_global_id_0 => bb_dense_B0_stall_region_out_global_id_0,
        out_lsu_unnamed_dense1_o_active => bb_dense_B0_stall_region_out_lsu_unnamed_dense1_o_active,
        out_stall_out => bb_dense_B0_stall_region_out_stall_out,
        out_unnamed_dense0 => bb_dense_B0_stall_region_out_unnamed_dense0,
        out_unnamed_dense0_avm_address => bb_dense_B0_stall_region_out_unnamed_dense0_avm_address,
        out_unnamed_dense0_avm_burstcount => bb_dense_B0_stall_region_out_unnamed_dense0_avm_burstcount,
        out_unnamed_dense0_avm_byteenable => bb_dense_B0_stall_region_out_unnamed_dense0_avm_byteenable,
        out_unnamed_dense0_avm_enable => bb_dense_B0_stall_region_out_unnamed_dense0_avm_enable,
        out_unnamed_dense0_avm_read => bb_dense_B0_stall_region_out_unnamed_dense0_avm_read,
        out_unnamed_dense0_avm_write => bb_dense_B0_stall_region_out_unnamed_dense0_avm_write,
        out_unnamed_dense0_avm_writedata => bb_dense_B0_stall_region_out_unnamed_dense0_avm_writedata,
        out_unnamed_dense1_avm_address => bb_dense_B0_stall_region_out_unnamed_dense1_avm_address,
        out_unnamed_dense1_avm_burstcount => bb_dense_B0_stall_region_out_unnamed_dense1_avm_burstcount,
        out_unnamed_dense1_avm_byteenable => bb_dense_B0_stall_region_out_unnamed_dense1_avm_byteenable,
        out_unnamed_dense1_avm_enable => bb_dense_B0_stall_region_out_unnamed_dense1_avm_enable,
        out_unnamed_dense1_avm_read => bb_dense_B0_stall_region_out_unnamed_dense1_avm_read,
        out_unnamed_dense1_avm_write => bb_dense_B0_stall_region_out_unnamed_dense1_avm_write,
        out_unnamed_dense1_avm_writedata => bb_dense_B0_stall_region_out_unnamed_dense1_avm_writedata,
        out_valid_out => bb_dense_B0_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dense_B0_branch(BLACKBOX,3)
    thedense_B0_branch : dense_B0_branch
    PORT MAP (
        in_arrayidx2 => bb_dense_B0_stall_region_out_arrayidx2,
        in_global_id_0 => bb_dense_B0_stall_region_out_global_id_0,
        in_stall_in_0 => in_stall_in_0,
        in_unnamed_dense0 => bb_dense_B0_stall_region_out_unnamed_dense0,
        in_valid_in => bb_dense_B0_stall_region_out_valid_out,
        out_arrayidx2 => dense_B0_branch_out_arrayidx2,
        out_global_id_0 => dense_B0_branch_out_global_id_0,
        out_stall_out => dense_B0_branch_out_stall_out,
        out_unnamed_dense0 => dense_B0_branch_out_unnamed_dense0,
        out_valid_out_0 => dense_B0_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_arrayidx2(GPOUT,24)
    out_arrayidx2 <= dense_B0_branch_out_arrayidx2;

    -- out_global_id_0(GPOUT,25)
    out_global_id_0 <= dense_B0_branch_out_global_id_0;

    -- out_lsu_unnamed_dense1_o_active(GPOUT,26)
    out_lsu_unnamed_dense1_o_active <= bb_dense_B0_stall_region_out_lsu_unnamed_dense1_o_active;

    -- out_stall_out_0(GPOUT,27)
    out_stall_out_0 <= dense_B0_merge_out_stall_out_0;

    -- out_unnamed_dense0(GPOUT,28)
    out_unnamed_dense0 <= dense_B0_branch_out_unnamed_dense0;

    -- out_unnamed_dense0_avm_address(GPOUT,29)
    out_unnamed_dense0_avm_address <= bb_dense_B0_stall_region_out_unnamed_dense0_avm_address;

    -- out_unnamed_dense0_avm_burstcount(GPOUT,30)
    out_unnamed_dense0_avm_burstcount <= bb_dense_B0_stall_region_out_unnamed_dense0_avm_burstcount;

    -- out_unnamed_dense0_avm_byteenable(GPOUT,31)
    out_unnamed_dense0_avm_byteenable <= bb_dense_B0_stall_region_out_unnamed_dense0_avm_byteenable;

    -- out_unnamed_dense0_avm_enable(GPOUT,32)
    out_unnamed_dense0_avm_enable <= bb_dense_B0_stall_region_out_unnamed_dense0_avm_enable;

    -- out_unnamed_dense0_avm_read(GPOUT,33)
    out_unnamed_dense0_avm_read <= bb_dense_B0_stall_region_out_unnamed_dense0_avm_read;

    -- out_unnamed_dense0_avm_write(GPOUT,34)
    out_unnamed_dense0_avm_write <= bb_dense_B0_stall_region_out_unnamed_dense0_avm_write;

    -- out_unnamed_dense0_avm_writedata(GPOUT,35)
    out_unnamed_dense0_avm_writedata <= bb_dense_B0_stall_region_out_unnamed_dense0_avm_writedata;

    -- out_unnamed_dense1_avm_address(GPOUT,36)
    out_unnamed_dense1_avm_address <= bb_dense_B0_stall_region_out_unnamed_dense1_avm_address;

    -- out_unnamed_dense1_avm_burstcount(GPOUT,37)
    out_unnamed_dense1_avm_burstcount <= bb_dense_B0_stall_region_out_unnamed_dense1_avm_burstcount;

    -- out_unnamed_dense1_avm_byteenable(GPOUT,38)
    out_unnamed_dense1_avm_byteenable <= bb_dense_B0_stall_region_out_unnamed_dense1_avm_byteenable;

    -- out_unnamed_dense1_avm_enable(GPOUT,39)
    out_unnamed_dense1_avm_enable <= bb_dense_B0_stall_region_out_unnamed_dense1_avm_enable;

    -- out_unnamed_dense1_avm_read(GPOUT,40)
    out_unnamed_dense1_avm_read <= bb_dense_B0_stall_region_out_unnamed_dense1_avm_read;

    -- out_unnamed_dense1_avm_write(GPOUT,41)
    out_unnamed_dense1_avm_write <= bb_dense_B0_stall_region_out_unnamed_dense1_avm_write;

    -- out_unnamed_dense1_avm_writedata(GPOUT,42)
    out_unnamed_dense1_avm_writedata <= bb_dense_B0_stall_region_out_unnamed_dense1_avm_writedata;

    -- out_valid_out_0(GPOUT,43)
    out_valid_out_0 <= dense_B0_branch_out_valid_out_0;

END normal;
