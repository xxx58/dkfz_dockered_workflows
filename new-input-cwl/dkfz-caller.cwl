#!/usr/bin/env cwl-runner

class: CommandLineTool
id: DKFZ-Workflow
label: DKFZ-Workflow
dct:creator:
  '@id': http://orcid.org/0000-0002-7681-6415
  foaf:name: Brian O'Connor
  foaf:mbox: mailto:briandoconnor@gmail.com

dct:contributor:
  foaf:name: Denis Yuen
  foaf:mbox: mailto:denis.yuen@oicr.on.ca

requirements:
- class: DockerRequirement
  dockerPull: cuhkhaosun/workflow-pancancer:dkfz-workflow-latest

cwlVersion: v1.0

inputs:
  normal-bam:
    type: File
    inputBinding:
      position: 1
      prefix: --normal-bam
    secondaryFiles:
    - .bai
  tumor-bam:
    type: File
    inputBinding:
      position: 2
      prefix: --tumor-bam
    secondaryFiles:
    - .bai
  reference-gz:
    type: File
    inputBinding:
      position: 3
      prefix: --reference-gz
  delly-bedpe:
    type: File
    inputBinding:
      position: 4
      prefix: --delly-bedpe
  run-id:
    type: string?
    inputBinding:
      position: 5
      prefix: --run-id


outputs:
  somatic_cnv_tar_gz:
    type: File
    outputBinding:
      glob: '*.somatic.cnv.tar.gz'
    secondaryFiles:
    - .md5
  somatic_cnv_vcf_gz:
    type: File
    outputBinding:
      glob: '*.somatic.cnv.vcf.gz'
    secondaryFiles:
    - .md5
    - .tbi
    - .tbi.md5
  germline_indel_vcf_gz:
    type: File
    outputBinding:
      glob: '*.germline.indel.vcf.gz'
    secondaryFiles:
    - .md5
    - .tbi
    - .tbi.md5
  somatic_indel_tar_gz:
    type: File
    outputBinding:
      glob: '*.somatic.indel.tar.gz'
    secondaryFiles:
    - .md5
  somatic_indel_vcf_gz:
    type: File
    outputBinding:
      glob: '*.somatic.indel.vcf.gz'
    secondaryFiles:
    - .md5
    - .tbi
    - .tbi.md5
  germline_snv_mnv_vcf_gz:
    type: File
    outputBinding:
      glob: '*.germline.snv_mnv.vcf.gz'
    secondaryFiles:
    - .md5
    - .tbi
    - .tbi.md5
  somatic_snv_mnv_tar_gz:
    type: File
    outputBinding:
      glob: '*.somatic.snv_mnv.tar.gz'
    secondaryFiles:
    - .md5
  somatic_snv_mnv_vcf_gz:
    type: File
    outputBinding:
      glob: '*.somatic.snv_mnv.vcf.gz'
    secondaryFiles:
    - .md5
    - .tbi
    - .tbi.md5
  qc_metrics:
    type: File
    outputBinding:
      glob: '*.qc_metrics.tar.gz'
    secondaryFiles:
    - .md5

baseCommand: [/start.sh, perl, /roddy/bin/run_workflow.pl]
