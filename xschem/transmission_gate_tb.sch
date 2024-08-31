v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -160 120 -160 140 {
lab=0}
N -160 140 -40 140 {
lab=0}
N -40 120 -40 140 {
lab=0}
N -100 120 -100 140 {
lab=0}
N -40 40 -40 60 {
lab=in}
N -100 40 -100 60 {
lab=vdd}
N -160 40 -160 60 {
lab=cont}
N -20 -60 20 -60 {
lab=in}
N -20 -80 20 -80 {
lab=cont}
N 80 -0 80 20 {
lab=0}
N 80 -140 80 -120 {
lab=vdd}
N 140 -60 180 -60 {
lab=out}
N 180 -60 180 -40 {
lab=out}
N 180 20 180 40 {
lab=0}
N -20 -40 20 -40 {
lab=cont_n}
N -500 30 -460 30 {
lab=cont}
N -330 30 -280 30 {
lab=cont_n}
N -370 140 -160 140 {
lab=0}
N -370 120 -370 140 {
lab=0}
N -370 10 -370 60 {
lab=cont_n}
N -440 90 -410 90 {
lab=cont}
N -440 -20 -440 90 {
lab=cont}
N -440 -20 -410 -20 {
lab=cont}
N -460 30 -440 30 {
lab=cont}
N -370 30 -330 30 {
lab=cont_n}
N -370 -20 -350 -20 {
lab=vdd}
N -350 -70 -350 -20 {
lab=vdd}
N -370 -70 -350 -70 {
lab=vdd}
N -370 -70 -370 -50 {
lab=vdd}
N -370 90 -350 90 {
lab=0}
N -350 90 -350 140 {
lab=0}
C {devices/code_shown.sym} 280 -130 0 0 {name=s1 only_toplevel=false value=".control
save all
tran 1n 15u
write transmission_gate_tb.raw
plot V(out)
.endc"}
C {devices/vsource.sym} -40 90 0 0 {name=V1 value="PULSE(0.5 0.48 1u 1n 1n 1u 10u)" savecurrent=false}
C {devices/vsource.sym} -100 90 0 0 {name=V2 value=1.8 savecurrent=false}
C {devices/vsource.sym} -160 90 0 0 {name=V3 value=1.8 savecurrent=false}
C {devices/lab_pin.sym} -160 140 0 0 {name=p1 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} -40 40 0 0 {name=p2 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} -100 40 0 0 {name=p3 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} -160 40 0 0 {name=p4 sig_type=std_logic lab=cont}
C {devices/lab_pin.sym} -20 -60 0 0 {name=p5 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} -20 -80 0 0 {name=p6 sig_type=std_logic lab=cont}
C {devices/lab_pin.sym} 80 -140 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 80 20 0 0 {name=p8 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 180 -60 2 0 {name=p9 sig_type=std_logic lab=out}
C {devices/capa.sym} 180 -10 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 180 40 0 0 {name=p10 sig_type=std_logic lab=0}
C {devices/code.sym} 280 30 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {/foss/designs/Transmission-Gate/xschem/transmission_gate.sym} 80 -60 0 0 {name=x1 W=20 L=1 NF=1 M=1}
C {devices/lab_pin.sym} -20 -40 0 0 {name=p11 sig_type=std_logic lab=cont_n}
C {devices/lab_pin.sym} -500 30 0 0 {name=p12 sig_type=std_logic lab=cont}
C {devices/lab_pin.sym} -280 30 2 0 {name=p13 sig_type=std_logic lab=cont_n}
C {sky130_fd_pr/nfet_01v8.sym} -390 90 0 0 {name=M2
L=0.15
W=1  
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -390 -20 0 0 {name=M11
L=0.15
W=1
nf=1 mult=1
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} -370 -70 1 0 {name=p14 sig_type=std_logic lab=vdd}
