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

-- VHDL created from dense_B1_branch
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

entity dense_B1_branch is
    port (
        in_arrayidx22 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_cmp1_phi_decision5_xor_RM : in std_logic_vector(0 downto 0);  -- ufix1
        in_global_id_05 : in std_logic_vector(31 downto 0);  -- ufix32
        in_inc : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_dense2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_arrayidx22 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_cmp1_phi_decision5_xor_RM : out std_logic_vector(0 downto 0);  -- ufix1
        out_global_id_05 : out std_logic_vector(31 downto 0);  -- ufix32
        out_inc : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end dense_B1_branch;

architecture normal of dense_B1_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx22_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe1_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal cmp1_phi_decision5_xor_RM_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B1_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dense_B1_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_05_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal inc_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_dense2_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,19)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- unnamed_dense2_cmp(LOGICAL,32)
    unnamed_dense2_cmp_q <= not (in_unnamed_dense2);

    -- valid_out_1_and(LOGICAL,36)
    valid_out_1_and_q <= in_valid_in and unnamed_dense2_cmp_q;

    -- valid_1_reg(REG,34)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (dense_B1_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,21)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,23)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,18)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,35)
    valid_out_0_and_q <= in_valid_in and in_unnamed_dense2;

    -- valid_0_reg(REG,33)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (dense_B1_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,20)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,22)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- dense_B1_branch_enable(LOGICAL,5)
    dense_B1_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- arrayidx22_reg(REG,2)
    arrayidx22_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            arrayidx22_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (dense_B1_branch_enable_q = "1") THEN
                arrayidx22_reg_q <= in_arrayidx22;
            END IF;
        END IF;
    END PROCESS;

    -- out_arrayidx22(GPOUT,24)
    out_arrayidx22 <= arrayidx22_reg_q;

    -- c0_exe1_reg(REG,3)
    c0_exe1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe1_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (dense_B1_branch_enable_q = "1") THEN
                c0_exe1_reg_q <= STD_LOGIC_VECTOR(in_c0_exe1);
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe1(GPOUT,25)
    out_c0_exe1 <= c0_exe1_reg_q;

    -- cmp1_phi_decision5_xor_RM_reg(REG,4)
    cmp1_phi_decision5_xor_RM_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            cmp1_phi_decision5_xor_RM_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (dense_B1_branch_enable_q = "1") THEN
                cmp1_phi_decision5_xor_RM_reg_q <= in_cmp1_phi_decision5_xor_RM;
            END IF;
        END IF;
    END PROCESS;

    -- out_cmp1_phi_decision5_xor_RM(GPOUT,26)
    out_cmp1_phi_decision5_xor_RM <= cmp1_phi_decision5_xor_RM_reg_q;

    -- global_id_05_reg(REG,7)
    global_id_05_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            global_id_05_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (dense_B1_branch_enable_q = "1") THEN
                global_id_05_reg_q <= in_global_id_05;
            END IF;
        END IF;
    END PROCESS;

    -- out_global_id_05(GPOUT,27)
    out_global_id_05 <= global_id_05_reg_q;

    -- inc_reg(REG,8)
    inc_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            inc_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (dense_B1_branch_enable_q = "1") THEN
                inc_reg_q <= in_inc;
            END IF;
        END IF;
    END PROCESS;

    -- out_inc(GPOUT,28)
    out_inc <= inc_reg_q;

    -- dense_B1_branch_enable_not(LOGICAL,6)
    dense_B1_branch_enable_not_q <= not (dense_B1_branch_enable_q);

    -- out_stall_out(GPOUT,29)
    out_stall_out <= dense_B1_branch_enable_not_q;

    -- out_valid_out_0(GPOUT,30)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,31)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
