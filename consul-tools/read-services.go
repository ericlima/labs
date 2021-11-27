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
    //fmt.Println(responseData)

    var elementos []interface{}
    
    // json.Unmarshal([]byte(responseData), &elementos)
    json.Unmarshal(responseData, &elementos)

    fmt.Println(elementos)

    for field, val := range elementos {
        fmt.Println("KV Pair: ", field, val)
        if val != nil {
            elementosInternos := val.(map[string]interface{})
            for fieldInterno, valInterno := range elementosInternos {
                fmt.Println("KV Pair interno: ", fieldInterno, valInterno)
            }
        }

    }

    //var responseObject map[string][]string

    //json.Unmarshal(responseData, &responseObject)
   
    //fmt.Println(responseObject)

}

