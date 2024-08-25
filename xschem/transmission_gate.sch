v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 30 -220 80 -220 {
lab=IN}
N 30 -220 30 -80 {
lab=IN}
N 30 -80 80 -80 {
lab=IN}
N 140 -220 190 -220 {
lab=OUT}
N 140 -80 190 -80 {
lab=OUT}
N 190 -220 190 -80 {
lab=OUT}
N 10 -150 30 -150 {
lab=IN}
N 190 -150 210 -150 {
lab=OUT}
N 110 -220 110 -190 {
lab=VDD}
N 110 -100 110 -80 {
lab=VSS}
N -80 -20 -60 -20 {
lab=CONT}
N 110 -280 110 -260 {
lab=CONT_N}
N -60 -20 110 -20 {
lab=CONT}
N 110 -40 110 -20 {
lab=CONT}
N 10 -350 110 -350 {
lab=CONT_N}
N 110 -350 110 -280 {
lab=CONT_N}
N -80 -350 10 -350 {
lab=CONT_N}
C {sky130_fd_pr/nfet_01v8.sym} 110 -60 3 0 {name=M2
L=L
W=W  
nf=NF mult=M
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 110 -240 1 0 {name=M11
L=L
W=W
nf=NF mult=M
model=pfet_01v8
spiceprefix=X
}
C {devices/opin.sym} 210 -150 0 0 {name=p1 lab=OUT}
C {devices/ipin.sym} 10 -150 0 0 {name=p2 lab=IN}
C {devices/iopin.sym} 110 -190 0 0 {name=p3 lab=VDD}
C {devices/iopin.sym} 110 -100 0 0 {name=p4 lab=VSS}
C {devices/ipin.sym} -80 -20 0 0 {name=p5 lab=CONT}
C {devices/ipin.sym} -80 -350 0 0 {name=p6 lab=CONT_N}
