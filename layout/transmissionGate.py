from gdsfactory import Component
from glayout.flow.pdk.mappedpdk import MappedPDK
from glayout.flow.placement.two_transistor_interdigitized import two_nfet_interdigitized
from glayout.flow.placement.two_transistor_interdigitized import two_pfet_interdigitized
from glayout.flow.pdk.util.comp_utils import prec_ref_center, movey, evaluate_bbox
from glayout.flow.routing.smart_route import smart_route
from glayout.flow.routing.c_route import c_route

from glayout.flow.placement.common_centroid_ab_ba import common_centroid_ab_ba
from glayout.flow.blocks.current_mirror import current_mirror
from glayout.flow.blocks.opamp import opamp

from glayout.flow.primitives.fet import nmos, pmos

from glayout.flow.pdk.sky130_mapped import sky130_mapped_pdk

from glayout.flow.routing.straight_route import straight_route
from glayout.flow.routing.L_route import L_route

from gdsfactory.components import rectangle

def TransmissionGate(pdk: MappedPDK, width: float, length: float, fingers: int) -> Component:
    TransmissionGate = Component(name="TransmissionGate")

    tran_gate_nmos = nmos(sky130_mapped_pdk, width=width, length=length, fingers=fingers, with_dummy=True, with_tie=True)
    tran_gate_nmos_ref = prec_ref_center(tran_gate_nmos)
    TransmissionGate.add(tran_gate_nmos_ref)

    tran_gate_pmos = pmos(sky130_mapped_pdk, width=width, length=length, fingers=fingers, with_dummy=True, with_tie=True)
    tran_gate_pmos_ref = prec_ref_center(tran_gate_pmos)
    TransmissionGate.add(tran_gate_pmos_ref)

    offset = evaluate_bbox(tran_gate_nmos)[1] + pdk.util_max_metal_seperation()
    movey(tran_gate_pmos_ref, offset)

    TransmissionGate.add_ports(tran_gate_nmos_ref.get_ports_list(), prefix="nmos_")
    TransmissionGate.add_ports(tran_gate_pmos_ref.get_ports_list(), prefix="pmos_")

    #TransmissionGate << smart_route(pdk, TransmissionGate.ports["nmos_drain_N"], TransmissionGate.ports["pmos_drain_S"], tran_gate_nmos_ref, TransmissionGate)
    #TransmissionGate << smart_route(pdk, TransmissionGate.ports["nmos_source_N"], TransmissionGate.ports["pmos_source_S"], tran_gate_nmos_ref, TransmissionGate)

    #TransmissionGate << straight_route(pdk, TransmissionGate.ports["nmos_drain_N"], TransmissionGate.ports["pmos_drain_S"])
    TransmissionGate << c_route(pdk, TransmissionGate.ports["nmos_drain_W"], TransmissionGate.ports["pmos_drain_W"])
    TransmissionGate << c_route(pdk, TransmissionGate.ports["nmos_source_E"], TransmissionGate.ports["pmos_source_E"])

    #print(tran_gate_nmos_ref.get_ports_dict())

    port_list = ["VDD", "VSS", "IN", "CONT", "CONT_N", "OUT"]
    pin_labels = list()
    iopin = rectangle(size=(5,5),layer=(72,16), centered=True)

    return TransmissionGate




tg = TransmissionGate(sky130_mapped_pdk, 4, 1, 2)

tg.show()

klayout_drc_result = sky130_mapped_pdk.drc_magic(tg, tg.name)

