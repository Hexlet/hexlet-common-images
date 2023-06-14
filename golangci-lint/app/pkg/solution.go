package pkg

import "fmt"

func f() int {
	foo_bar := 3
	if foo_bar == 0 {
	}
	if foo_bar != 0 {
	}
	defer fmt.Println("Finish!")
	return foo_bar
}
