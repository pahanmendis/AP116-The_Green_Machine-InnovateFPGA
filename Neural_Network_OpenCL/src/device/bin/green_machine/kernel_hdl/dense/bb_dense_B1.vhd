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

-- VHDL created from bb_dense_B1
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

entity bb_dense_B1 is
    port (
        in_add113_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_add113_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_arrayidx22_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx22_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_global_id_05_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_05_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_02_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_02_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense3_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_dense3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense3_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense4_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_dense4_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense4_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense4_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_arrayidx22 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_cmp1_phi_decision5_xor_RM : out std_logic_vector(0 downto 0);  -- ufix1
        out_global_id_05 : out std_logic_vector(31 downto 0);  -- ufix32
        out_inc : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
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
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_dense_B1;

architecture normal of bb_dense_B1 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_dense_B1_stall_region is
        port (
            in_add113 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_arrayidx22 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_05 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_02 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense3_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense3_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense4_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_dense4_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense4_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense4_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_arrayidx22 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_cmp1_phi_decision5_xor_RM : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_global_id_05 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_inc : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_dense2 : out std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component dense_B1_branch is
        port (
            in_arrayidx22 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_cmp1_phi_decision5_xor_RM : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_05 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_inc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_dense2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_arrayidx22 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_cmp1_phi_decision5_xor_RM : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_global_id_05 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_inc : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component dense_B1_merge is
        port (
            in_add113_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_add113_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_arrayidx22_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx22_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_05_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_05_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_02_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_02_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_add113 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_arrayidx22 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_global_id_05 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_02 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_dense_B1_stall_region_out_arrayidx22 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_dense_B1_stall_region_out_c0_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B1_stall_region_out_cmp1_phi_decision5_xor_RM : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_stall_region_out_global_id_05 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B1_stall_region_out_inc : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B1_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_stall_region_out_unnamed_dense2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_stall_region_out_unnamed_dense3_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_dense_B1_stall_region_out_unnamed_dense3_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_dense_B1_stall_region_out_unnamed_dense3_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B1_stall_region_out_unnamed_dense3_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_stall_region_out_unnamed_dense3_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_stall_region_out_unnamed_dense3_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_stall_region_out_unnamed_dense3_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_dense_B1_stall_region_out_unnamed_dense4_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_dense_B1_stall_region_out_unnamed_dense4_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_dense_B1_stall_region_out_unnamed_dense4_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_dense_B1_stall_region_out_unnamed_dense4_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_stall_region_out_unnamed_dense4_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_stall_region_out_unnamed_dense4_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_dense_B1_stall_region_out_unnamed_dense4_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_dense_B1_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B1_branch_out_arrayidx22 : STD_LOGIC_VECTOR (63 downto 0);
    signal dense_B1_branch_out_c0_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_B1_branch_out_cmp1_phi_decision5_xor_RM : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B1_branch_out_global_id_05 : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_B1_branch_out_inc : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_B1_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B1_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B1_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B1_merge_out_add113 : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_B1_merge_out_arrayidx22 : STD_LOGIC_VECTOR (63 downto 0);
    signal dense_B1_merge_out_global_id_05 : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_B1_merge_out_j_02 : STD_LOGIC_VECTOR (31 downto 0);
    signal dense_B1_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B1_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B1_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- dense_B1_merge(BLACKBOX,4)
    thedense_B1_merge : dense_B1_merge
    PORT MAP (
        in_add113_0 => in_add113_0,
        in_add113_1 => in_add113_1,
        in_arrayidx22_0 => in_arrayidx22_0,
        in_arrayidx22_1 => in_arrayidx22_1,
        in_global_id_05_0 => in_global_id_05_0,
        in_global_id_05_1 => in_global_id_05_1,
        in_j_02_0 => in_j_02_0,
        in_j_02_1 => in_j_02_1,
        in_stall_in => bb_dense_B1_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_add113 => dense_B1_merge_out_add113,
        out_arrayidx22 => dense_B1_merge_out_arrayidx22,
        out_global_id_05 => dense_B1_merge_out_global_id_05,
        out_j_02 => dense_B1_merge_out_j_02,
        out_stall_out_0 => dense_B1_merge_out_stall_out_0,
        out_stall_out_1 => dense_B1_merge_out_stall_out_1,
        out_valid_out => dense_B1_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_dense_B1_stall_region(BLACKBOX,2)
    thebb_dense_B1_stall_region : bb_dense_B1_stall_region
    PORT MAP (
        in_add113 => dense_B1_merge_out_add113,
        in_arrayidx22 => dense_B1_merge_out_arrayidx22,
        in_filter_weight => in_filter_weight,
        in_flush => in_flush,
        in_global_id_05 => dense_B1_merge_out_global_id_05,
        in_input_im => in_input_im,
        in_input_size => in_input_size,
        in_j_02 => dense_B1_merge_out_j_02,
        in_stall_in => dense_B1_branch_out_stall_out,
        in_unnamed_dense3_avm_readdata => in_unnamed_dense3_avm_readdata,
        in_unnamed_dense3_avm_readdatavalid => in_unnamed_dense3_avm_readdatavalid,
        in_unnamed_dense3_avm_waitrequest => in_unnamed_dense3_avm_waitrequest,
        in_unnamed_dense3_avm_writeack => in_unnamed_dense3_avm_writeack,
        in_unnamed_dense4_avm_readdata => in_unnamed_dense4_avm_readdata,
        in_unnamed_dense4_avm_readdatavalid => in_unnamed_dense4_avm_readdatavalid,
        in_unnamed_dense4_avm_waitrequest => in_unnamed_dense4_avm_waitrequest,
        in_unnamed_dense4_avm_writeack => in_unnamed_dense4_avm_writeack,
        in_valid_in => dense_B1_merge_out_valid_out,
        out_arrayidx22 => bb_dense_B1_stall_region_out_arrayidx22,
        out_c0_exe1 => bb_dense_B1_stall_region_out_c0_exe1,
        out_cmp1_phi_decision5_xor_RM => bb_dense_B1_stall_region_out_cmp1_phi_decision5_xor_RM,
        out_global_id_05 => bb_dense_B1_stall_region_out_global_id_05,
        out_inc => bb_dense_B1_stall_region_out_inc,
        out_stall_out => bb_dense_B1_stall_region_out_stall_out,
        out_unnamed_dense2 => bb_dense_B1_stall_region_out_unnamed_dense2,
        out_unnamed_dense3_avm_address => bb_dense_B1_stall_region_out_unnamed_dense3_avm_address,
        out_unnamed_dense3_avm_burstcount => bb_dense_B1_stall_region_out_unnamed_dense3_avm_burstcount,
        out_unnamed_dense3_avm_byteenable => bb_dense_B1_stall_region_out_unnamed_dense3_avm_byteenable,
        out_unnamed_dense3_avm_enable => bb_dense_B1_stall_region_out_unnamed_dense3_avm_enable,
        out_unnamed_dense3_avm_read => bb_dense_B1_stall_region_out_unnamed_dense3_avm_read,
        out_unnamed_dense3_avm_write => bb_dense_B1_stall_region_out_unnamed_dense3_avm_write,
        out_unnamed_dense3_avm_writedata => bb_dense_B1_stall_region_out_unnamed_dense3_avm_writedata,
        out_unnamed_dense4_avm_address => bb_dense_B1_stall_region_out_unnamed_dense4_avm_address,
        out_unnamed_dense4_avm_burstcount => bb_dense_B1_stall_region_out_unnamed_dense4_avm_burstcount,
        out_unnamed_dense4_avm_byteenable => bb_dense_B1_stall_region_out_unnamed_dense4_avm_byteenable,
        out_unnamed_dense4_avm_enable => bb_dense_B1_stall_region_out_unnamed_dense4_avm_enable,
        out_unnamed_dense4_avm_read => bb_dense_B1_stall_region_out_unnamed_dense4_avm_read,
        out_unnamed_dense4_avm_write => bb_dense_B1_stall_region_out_unnamed_dense4_avm_write,
        out_unnamed_dense4_avm_writedata => bb_dense_B1_stall_region_out_unnamed_dense4_avm_writedata,
        out_valid_out => bb_dense_B1_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dense_B1_branch(BLACKBOX,3)
    thedense_B1_branch : dense_B1_branch
    PORT MAP (
        in_arrayidx22 => bb_dense_B1_stall_region_out_arrayidx22,
        in_c0_exe1 => bb_dense_B1_stall_region_out_c0_exe1,
        in_cmp1_phi_decision5_xor_RM => bb_dense_B1_stall_region_out_cmp1_phi_decision5_xor_RM,
        in_global_id_05 => bb_dense_B1_stall_region_out_global_id_05,
        in_inc => bb_dense_B1_stall_region_out_inc,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_unnamed_dense2 => bb_dense_B1_stall_region_out_unnamed_dense2,
        in_valid_in => bb_dense_B1_stall_region_out_valid_out,
        out_arrayidx22 => dense_B1_branch_out_arrayidx22,
        out_c0_exe1 => dense_B1_branch_out_c0_exe1,
        out_cmp1_phi_decision5_xor_RM => dense_B1_branch_out_cmp1_phi_decision5_xor_RM,
        out_global_id_05 => dense_B1_branch_out_global_id_05,
        out_inc => dense_B1_branch_out_inc,
        out_stall_out => dense_B1_branch_out_stall_out,
        out_valid_out_0 => dense_B1_branch_out_valid_out_0,
        out_valid_out_1 => dense_B1_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_arrayidx22(GPOUT,29)
    out_arrayidx22 <= dense_B1_branch_out_arrayidx22;

    -- out_c0_exe1(GPOUT,30)
    out_c0_exe1 <= dense_B1_branch_out_c0_exe1;

    -- out_cmp1_phi_decision5_xor_RM(GPOUT,31)
    out_cmp1_phi_decision5_xor_RM <= dense_B1_branch_out_cmp1_phi_decision5_xor_RM;

    -- out_global_id_05(GPOUT,32)
    out_global_id_05 <= dense_B1_branch_out_global_id_05;

    -- out_inc(GPOUT,33)
    out_inc <= dense_B1_branch_out_inc;

    -- out_stall_out_0(GPOUT,34)
    out_stall_out_0 <= dense_B1_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,35)
    out_stall_out_1 <= dense_B1_merge_out_stall_out_1;

    -- out_unnamed_dense3_avm_address(GPOUT,36)
    out_unnamed_dense3_avm_address <= bb_dense_B1_stall_region_out_unnamed_dense3_avm_address;

    -- out_unnamed_dense3_avm_burstcount(GPOUT,37)
    out_unnamed_dense3_avm_burstcount <= bb_dense_B1_stall_region_out_unnamed_dense3_avm_burstcount;

    -- out_unnamed_dense3_avm_byteenable(GPOUT,38)
    out_unnamed_dense3_avm_byteenable <= bb_dense_B1_stall_region_out_unnamed_dense3_avm_byteenable;

    -- out_unnamed_dense3_avm_enable(GPOUT,39)
    out_unnamed_dense3_avm_enable <= bb_dense_B1_stall_region_out_unnamed_dense3_avm_enable;

    -- out_unnamed_dense3_avm_read(GPOUT,40)
    out_unnamed_dense3_avm_read <= bb_dense_B1_stall_region_out_unnamed_dense3_avm_read;

    -- out_unnamed_dense3_avm_write(GPOUT,41)
    out_unnamed_dense3_avm_write <= bb_dense_B1_stall_region_out_unnamed_dense3_avm_write;

    -- out_unnamed_dense3_avm_writedata(GPOUT,42)
    out_unnamed_dense3_avm_writedata <= bb_dense_B1_stall_region_out_unnamed_dense3_avm_writedata;

    -- out_unnamed_dense4_avm_address(GPOUT,43)
    out_unnamed_dense4_avm_address <= bb_dense_B1_stall_region_out_unnamed_dense4_avm_address;

    -- out_unnamed_dense4_avm_burstcount(GPOUT,44)
    out_unnamed_dense4_avm_burstcount <= bb_dense_B1_stall_region_out_unnamed_dense4_avm_burstcount;

    -- out_unnamed_dense4_avm_byteenable(GPOUT,45)
    out_unnamed_dense4_avm_byteenable <= bb_dense_B1_stall_region_out_unnamed_dense4_avm_byteenable;

    -- out_unnamed_dense4_avm_enable(GPOUT,46)
    out_unnamed_dense4_avm_enable <= bb_dense_B1_stall_region_out_unnamed_dense4_avm_enable;

    -- out_unnamed_dense4_avm_read(GPOUT,47)
    out_unnamed_dense4_avm_read <= bb_dense_B1_stall_region_out_unnamed_dense4_avm_read;

    -- out_unnamed_dense4_avm_write(GPOUT,48)
    out_unnamed_dense4_avm_write <= bb_dense_B1_stall_region_out_unnamed_dense4_avm_write;

    -- out_unnamed_dense4_avm_writedata(GPOUT,49)
    out_unnamed_dense4_avm_writedata <= bb_dense_B1_stall_region_out_unnamed_dense4_avm_writedata;

    -- out_valid_out_0(GPOUT,50)
    out_valid_out_0 <= dense_B1_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,51)
    out_valid_out_1 <= dense_B1_branch_out_valid_out_1;

END normal;
