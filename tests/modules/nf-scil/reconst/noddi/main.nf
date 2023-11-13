#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { RECONST_NODDI } from '../../../../../modules/nf-scil/reconst/noddi/main.nf'

workflow test_reconst_noddi_save_kernels {
    
    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['reconst']['noddi']['dwi'], checkIfExists: true),
        file(params.test_data['reconst']['noddi']['bval'], checkIfExists: true),
        file(params.test_data['reconst']['noddi']['bvec'], checkIfExists: true),
        [],
        file(params.test_data['reconst']['noddi']['mask'], checkIfExists: true)
    ]

    RECONST_NODDI ( input )
}

workflow test_reconst_noddi_load_kernels {
    
    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['reconst']['noddi']['dwi'], checkIfExists: true),
        file(params.test_data['reconst']['noddi']['bval'], checkIfExists: true),
        file(params.test_data['reconst']['noddi']['bvec'], checkIfExists: true),
        file(params.test_data['reconst']['noddi']['kernels'], checkIfExists: true),
        file(params.test_data['reconst']['noddi']['mask'], checkIfExists: true)
    ]

    RECONST_NODDI ( input )
}

workflow test_reconst_noddi_save_kernels_no_mask {
    
    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['reconst']['noddi']['dwi'], checkIfExists: true),
        file(params.test_data['reconst']['noddi']['bval'], checkIfExists: true),
        file(params.test_data['reconst']['noddi']['bvec'], checkIfExists: true),
        [], []
    ]

    RECONST_NODDI ( input )
}

workflow test_reconst_noddi_load_kernels_no_mask {
    
    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['reconst']['noddi']['dwi'], checkIfExists: true),
        file(params.test_data['reconst']['noddi']['bval'], checkIfExists: true),
        file(params.test_data['reconst']['noddi']['bvec'], checkIfExists: true),
        file(params.test_data['reconst']['noddi']['kernels'], checkIfExists: true),
        []
    ]

    RECONST_NODDI ( input )
}
