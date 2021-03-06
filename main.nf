#!/usr/bin/env nextflow

params.n_pods = 15
params.result_dir = "$launchDir"

idx_ch = Channel.of( 1..params.n_pods )
process run_lm {
  input: val i from idx_ch

  output: file 'fitted_model.rds' into lm_ch

  """
  run_lm.R $i
  """
}


process combine_results {
  echo true
  publishDir params.result_dir, mode: "copy"

  input: file 'raw_result' from lm_ch.collect()

  output: file 'result.rds' into result_ch

  """
  combine_results.R raw_result*
  """
}
