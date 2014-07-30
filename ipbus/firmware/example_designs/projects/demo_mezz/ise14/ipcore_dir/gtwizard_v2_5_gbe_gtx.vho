    


------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 2.5
--  \   \         Application : 7 Series FPGAs Transceivers Wizard
--  /   /         Filename : gtwizard_v2_5_gbe_gtx.vho
-- /___/   /\      
-- \   \  /  \ 
--  \___\/\___\
--
--
-- Instantiation Template
-- Generated by Xilinx 7 Series FPGAs Transceivers Wizard


--**************************Wrapper Component Declarations*****************************
component gtwizard_v2_5_gbe_gtx 
generic
(
    -- Simulation attributes
    WRAPPER_SIM_GTRESET_SPEEDUP     : string     :=  "false";        -- Set to "true" to speed up sim reset
    RX_DFE_KL_CFG2_IN               : bit_vector :=  X"3010D90C";
    PMA_RSV_IN                      : bit_vector :=  x"00018480";
    SIM_VERSION                     : string     :=  "4.0"
);
port
(
    --_________________________________________________________________________
    --_________________________________________________________________________
    --GT0  (X0Y1)
    --____________________________CHANNEL PORTS________________________________
    --------------------------------- CPLL Ports -------------------------------
    GT0_CPLLFBCLKLOST_OUT                   : out  std_logic;
    GT0_CPLLLOCK_OUT                        : out  std_logic;
    GT0_CPLLLOCKDETCLK_IN                   : in   std_logic;
    GT0_CPLLREFCLKLOST_OUT                  : out  std_logic;
    GT0_CPLLRESET_IN                        : in   std_logic;
    -------------------------- Channel - Clocking Ports ------------------------
    GT0_GTREFCLK0_IN                        : in   std_logic;
    ---------------------------- Channel - DRP Ports  --------------------------
    GT0_DRPADDR_IN                          : in   std_logic_vector(8 downto 0);
    GT0_DRPCLK_IN                           : in   std_logic;
    GT0_DRPDI_IN                            : in   std_logic_vector(15 downto 0);
    GT0_DRPDO_OUT                           : out  std_logic_vector(15 downto 0);
    GT0_DRPEN_IN                            : in   std_logic;
    GT0_DRPRDY_OUT                          : out  std_logic;
    GT0_DRPWE_IN                            : in   std_logic;
    ------------------------------- Loopback Ports -----------------------------
    GT0_LOOPBACK_IN                         : in   std_logic_vector(2 downto 0);
    ------------------------------ Power-Down Ports ----------------------------
    GT0_RXPD_IN                             : in   std_logic_vector(1 downto 0);
    GT0_TXPD_IN                             : in   std_logic_vector(1 downto 0);
    --------------------- RX Initialization and Reset Ports --------------------
    GT0_RXUSERRDY_IN                        : in   std_logic;
    -------------------------- RX Margin Analysis Ports ------------------------
    GT0_EYESCANDATAERROR_OUT                : out  std_logic;
    ------------------------- Receive Ports - CDR Ports ------------------------
    GT0_RXCDRLOCK_OUT                       : out  std_logic;
    ------------------- Receive Ports - Clock Correction Ports -----------------
    GT0_RXCLKCORCNT_OUT                     : out  std_logic_vector(1 downto 0);
    ------------------ Receive Ports - FPGA RX Interface Ports -----------------
    GT0_RXUSRCLK_IN                         : in   std_logic;
    GT0_RXUSRCLK2_IN                        : in   std_logic;
    ------------------ Receive Ports - FPGA RX interface Ports -----------------
    GT0_RXDATA_OUT                          : out  std_logic_vector(15 downto 0);
    ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
    GT0_RXDISPERR_OUT                       : out  std_logic_vector(1 downto 0);
    GT0_RXNOTINTABLE_OUT                    : out  std_logic_vector(1 downto 0);
    --------------------------- Receive Ports - RX AFE -------------------------
    GT0_GTXRXP_IN                           : in   std_logic;
    ------------------------ Receive Ports - RX AFE Ports ----------------------
    GT0_GTXRXN_IN                           : in   std_logic;
    ------------------- Receive Ports - RX Buffer Bypass Ports -----------------
    GT0_RXBUFRESET_IN                       : in   std_logic;
    GT0_RXBUFSTATUS_OUT                     : out  std_logic_vector(2 downto 0);
    -------------- Receive Ports - RX Byte and Word Alignment Ports ------------
    GT0_RXMCOMMAALIGNEN_IN                  : in   std_logic;
    GT0_RXPCOMMAALIGNEN_IN                  : in   std_logic;
    --------------------- Receive Ports - RX Equilizer Ports -------------------
    GT0_RXLPMHFHOLD_IN                      : in   std_logic;
    GT0_RXLPMLFHOLD_IN                      : in   std_logic;
    --------------- Receive Ports - RX Fabric Output Control Ports -------------
    GT0_RXOUTCLK_OUT                        : out  std_logic;
    ------------- Receive Ports - RX Initialization and Reset Ports ------------
    GT0_GTRXRESET_IN                        : in   std_logic;
    GT0_RXPCSRESET_IN                       : in   std_logic;
    GT0_RXPMARESET_IN                       : in   std_logic;
    ----------------- Receive Ports - RX Polarity Control Ports ----------------
    GT0_RXPOLARITY_IN                       : in   std_logic;
    ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
    GT0_RXCHARISCOMMA_OUT                   : out  std_logic_vector(1 downto 0);
    GT0_RXCHARISK_OUT                       : out  std_logic_vector(1 downto 0);
    -------------- Receive Ports -RX Initialization and Reset Ports ------------
    GT0_RXRESETDONE_OUT                     : out  std_logic;
    --------------------- TX Initialization and Reset Ports --------------------
    GT0_GTTXRESET_IN                        : in   std_logic;
    GT0_TXUSERRDY_IN                        : in   std_logic;
    ---------------- Transmit Ports - 8b10b Encoder Control Ports --------------
    GT0_TXCHARDISPMODE_IN                   : in   std_logic_vector(1 downto 0);
    GT0_TXCHARDISPVAL_IN                    : in   std_logic_vector(1 downto 0);
    ------------------ Transmit Ports - FPGA TX Interface Ports ----------------
    GT0_TXUSRCLK_IN                         : in   std_logic;
    GT0_TXUSRCLK2_IN                        : in   std_logic;
    --------------------- Transmit Ports - PCI Express Ports -------------------
    GT0_TXELECIDLE_IN                       : in   std_logic;
    ---------------------- Transmit Ports - TX Buffer Ports --------------------
    GT0_TXBUFSTATUS_OUT                     : out  std_logic_vector(1 downto 0);
    ------------------ Transmit Ports - TX Data Path interface -----------------
    GT0_TXDATA_IN                           : in   std_logic_vector(15 downto 0);
    ---------------- Transmit Ports - TX Driver and OOB signaling --------------
    GT0_GTXTXN_OUT                          : out  std_logic;
    GT0_GTXTXP_OUT                          : out  std_logic;
    ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
    GT0_TXOUTCLK_OUT                        : out  std_logic;
    GT0_TXOUTCLKFABRIC_OUT                  : out  std_logic;
    GT0_TXOUTCLKPCS_OUT                     : out  std_logic;
    --------------------- Transmit Ports - TX Gearbox Ports --------------------
    GT0_TXCHARISK_IN                        : in   std_logic_vector(1 downto 0);
    ------------- Transmit Ports - TX Initialization and Reset Ports -----------
    GT0_TXPCSRESET_IN                       : in   std_logic;
    GT0_TXRESETDONE_OUT                     : out  std_logic;
    ----------------- Transmit Ports - TX Polarity Control Ports ---------------
    GT0_TXPOLARITY_IN                       : in   std_logic;


    --____________________________COMMON PORTS________________________________
    ---------------------- Common Block  - Ref Clock Ports ---------------------
    GT0_GTREFCLK0_COMMON_IN                 : in   std_logic;
    ------------------------- Common Block - QPLL Ports ------------------------
    GT0_QPLLLOCK_OUT                        : out  std_logic;
    GT0_QPLLLOCKDETCLK_IN                   : in   std_logic;
    GT0_QPLLREFCLKLOST_OUT                  : out  std_logic;
    GT0_QPLLRESET_IN                        : in   std_logic

);
end component;
    



    ----------------------------- The GTX Wrapper -----------------------------
    gtwizard_v2_5_gbe_gtx_i : gtwizard_v2_5_gbe_gtx
    generic map
    (
        -- Simulation attributes
        WRAPPER_SIM_GTRESET_SPEEDUP =>  "TRUE"         -- Speedup is turned on for simulation
    ) 
    port map
    (
     --_____________________________________________________________________
     --_____________________________________________________________________
          --____________________________CHANNEL PORTS________________________________
        --------------------------------- CPLL Ports -------------------------------
        GT0_CPLLFBCLKLOST_OUT           =>      ,
        GT0_CPLLLOCK_OUT                =>      ,
        GT0_CPLLLOCKDETCLK_IN           =>      ,
        GT0_CPLLREFCLKLOST_OUT          =>      ,
        GT0_CPLLRESET_IN                =>      ,
        -------------------------- Channel - Clocking Ports ------------------------
        GT0_GTREFCLK0_IN                =>      ,
        ---------------------------- Channel - DRP Ports  --------------------------
        GT0_DRPADDR_IN                  =>      ,
        GT0_DRPCLK_IN                   =>      ,
        GT0_DRPDI_IN                    =>      ,
        GT0_DRPDO_OUT                   =>      ,
        GT0_DRPEN_IN                    =>      ,
        GT0_DRPRDY_OUT                  =>      ,
        GT0_DRPWE_IN                    =>      ,
        ------------------------------- Loopback Ports -----------------------------
        GT0_LOOPBACK_IN                 =>      ,
        ------------------------------ Power-Down Ports ----------------------------
        GT0_RXPD_IN                     =>      ,
        GT0_TXPD_IN                     =>      ,
        --------------------- RX Initialization and Reset Ports --------------------
        GT0_RXUSERRDY_IN                =>      ,
        -------------------------- RX Margin Analysis Ports ------------------------
        GT0_EYESCANDATAERROR_OUT        =>      ,
        ------------------------- Receive Ports - CDR Ports ------------------------
        GT0_RXCDRLOCK_OUT               =>      ,
        ------------------- Receive Ports - Clock Correction Ports -----------------
        GT0_RXCLKCORCNT_OUT             =>      ,
        ------------------ Receive Ports - FPGA RX Interface Ports -----------------
        GT0_RXUSRCLK_IN                 =>      ,
        GT0_RXUSRCLK2_IN                =>      ,
        ------------------ Receive Ports - FPGA RX interface Ports -----------------
        GT0_RXDATA_OUT                  =>      ,
        ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
        GT0_RXDISPERR_OUT               =>      ,
        GT0_RXNOTINTABLE_OUT            =>      ,
        --------------------------- Receive Ports - RX AFE -------------------------
        GT0_GTXRXP_IN                   =>      ,
        ------------------------ Receive Ports - RX AFE Ports ----------------------
        GT0_GTXRXN_IN                   =>      ,
        ------------------- Receive Ports - RX Buffer Bypass Ports -----------------
        GT0_RXBUFRESET_IN               =>      ,
        GT0_RXBUFSTATUS_OUT             =>      ,
        -------------- Receive Ports - RX Byte and Word Alignment Ports ------------
        GT0_RXMCOMMAALIGNEN_IN          =>      ,
        GT0_RXPCOMMAALIGNEN_IN          =>      ,
        --------------------- Receive Ports - RX Equilizer Ports -------------------
        GT0_RXLPMHFHOLD_IN              =>      ,
        GT0_RXLPMLFHOLD_IN              =>      ,
        --------------- Receive Ports - RX Fabric Output Control Ports -------------
        GT0_RXOUTCLK_OUT                =>      ,
        ------------- Receive Ports - RX Initialization and Reset Ports ------------
        GT0_GTRXRESET_IN                =>      ,
        GT0_RXPCSRESET_IN               =>      ,
        GT0_RXPMARESET_IN               =>      ,
        ----------------- Receive Ports - RX Polarity Control Ports ----------------
        GT0_RXPOLARITY_IN               =>      ,
        ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
        GT0_RXCHARISCOMMA_OUT           =>      ,
        GT0_RXCHARISK_OUT               =>      ,
        -------------- Receive Ports -RX Initialization and Reset Ports ------------
        GT0_RXRESETDONE_OUT             =>      ,
        --------------------- TX Initialization and Reset Ports --------------------
        GT0_GTTXRESET_IN                =>      ,
        GT0_TXUSERRDY_IN                =>      ,
        ---------------- Transmit Ports - 8b10b Encoder Control Ports --------------
        GT0_TXCHARDISPMODE_IN           =>      ,
        GT0_TXCHARDISPVAL_IN            =>      ,
        ------------------ Transmit Ports - FPGA TX Interface Ports ----------------
        GT0_TXUSRCLK_IN                 =>      ,
        GT0_TXUSRCLK2_IN                =>      ,
        --------------------- Transmit Ports - PCI Express Ports -------------------
        GT0_TXELECIDLE_IN               =>      ,
        ---------------------- Transmit Ports - TX Buffer Ports --------------------
        GT0_TXBUFSTATUS_OUT             =>      ,
        ------------------ Transmit Ports - TX Data Path interface -----------------
        GT0_TXDATA_IN                   =>      ,
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------
        GT0_GTXTXN_OUT                  =>      ,
        GT0_GTXTXP_OUT                  =>      ,
        ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
        GT0_TXOUTCLK_OUT                =>      ,
        GT0_TXOUTCLKFABRIC_OUT          =>      ,
        GT0_TXOUTCLKPCS_OUT             =>      ,
        --------------------- Transmit Ports - TX Gearbox Ports --------------------
        GT0_TXCHARISK_IN                =>      ,
        ------------- Transmit Ports - TX Initialization and Reset Ports -----------
        GT0_TXPCSRESET_IN               =>      ,
        GT0_TXRESETDONE_OUT             =>      ,
        ----------------- Transmit Ports - TX Polarity Control Ports ---------------
        GT0_TXPOLARITY_IN               =>      ,


    
    --____________________________COMMON PORTS________________________________
    ---------------------- Common Block  - Ref Clock Ports ---------------------
        GT0_GTREFCLK0_COMMON_IN         =>      ,
    ------------------------- Common Block - QPLL Ports ------------------------
        GT0_QPLLLOCK_OUT                =>      ,
        GT0_QPLLLOCKDETCLK_IN           =>      ,
        GT0_QPLLREFCLKLOST_OUT          =>      ,
        GT0_QPLLRESET_IN                =>      

     
    );
    


