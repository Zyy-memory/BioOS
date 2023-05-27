workflow test {
    String name1
    String name2
    File request

    call hello as step1 {
        input: name = name1, request = request
    }

    call hello as step21 {
        input: name = name2, request = step1.response
    }

    call hello as step22 {
        input: name = name2, request = step1.response
    }

    output {
        String resp = "abc"
        File response1 = step21.response
        File response2 = step22.response
    }
}

task hello {
    String name
    File request

    command {
        echo 'Hello ${name}!' > resp.txt
        cat ${request} >> resp.txt
    }

    output {
        File response = "resp.txt"
    }

    runtime {
        docker: "paas-tob-dev-cn-beijing.cr.volces.com/infcplibrary/ubuntu:18.04"
        memory: "1 GB"
        cpu: "1"
        disk: "25 GB"
    }
}
