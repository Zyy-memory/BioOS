version 1.0

task call_string {
    input {
        String value 
    }

    command {
        echo 'Hello ${value}!' > resp.txt
    }

    output {
        File response = "resp.txt"
    }

    runtime {
        docker: "cr-cn-beijing.volces.com/bio-island/busybox:1.30.0"
        memory: "1 GB"
        cpu: "1"
        disk: "0.5 GB"
    }
}

task call_int {
    input {
        Int value
    }

    command {
        echo 'Hello ${value}!' > resp.txt
    }

    output {
        File response = "resp.txt"
    }

    runtime {
        docker: "cr-cn-beijing.volces.com/bio-island/busybox:1.30.0"
        memory: "1 GB"
        cpu: "1"
        disk: "0.5 GB"
    }
}

task call_float {
    input {
        Float value
    }

    command {
        echo 'Hello ${value}!' > resp.txt
    }

    output {
        File response = "resp.txt"
    }

    runtime {
        docker: "cr-cn-beijing.volces.com/bio-island/busybox:1.30.0"
        memory: "1 GB"
        cpu: "1"
        disk: "0.5 GB"
    }
}

task call_bool {
    input {
        Boolean value 
    }

    command {
        echo 'Hello ${value}!' > resp.txt
    }

    output {
        File response = "resp.txt"
    }

    runtime {
        docker: "cr-cn-beijing.volces.com/bio-island/busybox:1.30.0"
        memory: "1 GB"
        cpu: "1"
        disk: "0.5 GB"
    }
}

task call_file {
    input {
        File value
    }

    command {
        cat ${value} > resp.txt
    }

    output {
        File response = "resp.txt"
    }

    runtime {
        docker: "cr-cn-beijing.volces.com/bio-island/busybox:1.30.0"
        memory: "1 GB"
        cpu: "1"
        disk: "0.5 GB"
    }
}

task call_slist {
    input {
        Array[String]+ value
    }

    command {
       echo ${sep=',' value} > resp.txt
    }

    output {
        File response = "resp.txt"
    }

    runtime {
        docker: "cr-cn-beijing.volces.com/bio-island/busybox:1.30.0"
        memory: "1 GB"
        cpu: "1"
        disk: "0.5 GB"
    }
}

task call_flist {
    input {
        Array[File]+ value
    }

    command {
       echo ${sep=',' value} > resp.txt
    }

    output {
        File response = "resp.txt"
    }

    runtime {
        docker: "cr-cn-beijing.volces.com/bio-island/busybox:1.30.0"
        memory: "1 GB"
        cpu: "1"
        disk: "0.5 GB"
    }
}

task call_s_list {
    input {
        Array[String] value
    }

    command {
       echo ${sep=',' value} > resp.txt
    }

    output {
        File response = "resp.txt"
    }

    runtime {
        docker: "cr-cn-beijing.volces.com/bio-island/busybox:1.30.0"
        memory: "1 GB"
        cpu: "1"
        disk: "0.5 GB"
    }
}

task call_f_list {
    input {
        Array[File] value
    }

    command {
       echo ${sep=',' value} > resp.txt
    }

    output {
        File response = "resp.txt"
    }

    runtime {
        docker: "cr-cn-beijing.volces.com/bio-island/busybox:1.30.0"
        memory: "1 GB"
        cpu: "1"
        disk: "0.5 GB"
    }
}

workflow test {
    input {
        Int int
        Float float 
        Boolean bool 
        String string 
        File file 
        Array[String] s_list
        Array[File] f_list
        Array[String]+ slist
        Array[File]+ flist
    }

    call call_int {
        input: value = int
    }

    call call_float {
        input: value = float
    }

    call call_bool {
        input: value = bool
    }

    call call_string {
        input: value = string
    }

    call call_file {
        input: value = file
    }

    call call_slist {
        input: value = slist
    }

    call call_flist {
        input: value = flist
    }

    call call_s_list {
        input: value = slist
    }

    call call_f_list {
        input: value = flist
    }

    output {
        File intRes = call_int.response
        File stringRes = call_string.response
        File floatRes = call_float.response
        File boolRes = call_bool.response
        File fileRes = call_file.response
        File slistRes = call_slist.response
        File flistRes = call_flist.response
        File s_listRes = call_s_list.response
        File f_listRes = call_f_list.response
    }
}
