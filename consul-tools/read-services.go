package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"os"
)


func main() {

    url := "http://consul.qas.impresa.pt//v1/catalog/nodes"

    response, err := http.Get(url)

    if err != nil {
        fmt.Print(err.Error())
        os.Exit(1)
    }

    responseData, err := ioutil.ReadAll(response.Body)
    if err != nil {
        log.Fatal(err)
    }

    var nodes []string = obtemNodes(responseData)

    for _,name := range nodes {
        fmt.Println(name)
    }

}

func obtemNodes(responseData []byte) []string{
    var retorno []string
    var elementos []interface{}
    json.Unmarshal(responseData, &elementos)
    for _, val := range elementos {
        if val != nil {
            elementosInternos := val.(map[string]interface{})
            for fieldInterno, valInterno := range elementosInternos {
                if fieldInterno == "Node" {
                    retorno = append(retorno, valInterno.(string))
                }
            }
        }
    }
    return retorno
}

