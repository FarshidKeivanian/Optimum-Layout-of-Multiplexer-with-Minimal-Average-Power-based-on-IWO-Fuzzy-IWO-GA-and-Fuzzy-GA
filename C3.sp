*2:1 MUX Static NMOS for Article Tehran
.Options list Node Post

.Option Scale=1U

MP1 1 S VDD VDD PCH L=0.18        W=0.21954397                                                                                                                                             			
MP2 1 S 0 0 NCH L=0.18            W=0.42517228                                                                                                                                                		
MN1 y S f f NCH L=0.18            W=1.61227782                                                                                                                                                                  			
MN2 x 1 f f NCH L=0.18            W=0.295673218                                                                                                                                                             			
                                                                                                                  			
VDD VDD 0 5
Vx x 0 5v
Vy y 0 5v
VS S 0 Pulse 0  5  2N 1N 1N 10N 20N
.Tran 200p 200n
.Print Tran V(x) V(y) V(S) V(f)

.Model  PCH PMOS  Level=1
.Model  NCH NMOS  Level=1

.PRINT TRAN POWER

.param VDD=5

.MEAS tran avgpower Avg Power from = 0 to = 20N
.MEAS tran maxpower max Power

.end