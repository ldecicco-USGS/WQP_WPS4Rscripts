# wps.des: id = name_no_spaces, title = title with spaces but no commas, abstract = abstract can have spaces no commas;
# wps.in: input, string, text input to demo, abstract about variable;

demo <- function(x){
  x <- as.numeric(x) + 3
}

output <- demo(input)
# wps.out: output, integer, title is output title, abstract is JSON object for item summary;


