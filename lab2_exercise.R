set.seed(1)
x1 <- 1:100
x2 <- rnorm(100)
x3 <- rnorm(100)
y <- x1 + rnorm(100)
data <- data.frame(y, x1, x2, x3)

fit <-lm(y ~ .,data=data)
summary(fit)

step(fit)

mars<-function(formula, data, control){
  fwd_out<-fwd_stepwise(formula,data)
  bwd_out<-bwd_stepwise(fwd_out)
  return(bwd_out)
}

mars.control<-function(){
  control_list<-list()
  return(control_list)
}

fwd_stepwise<-function(formula, data){
  fwd_list<-lm(formula, data)
  return(fwd_list)
}

bwd_stepwise<-function(bwd_in){ 
  bwd_list<-step(bwd_in)
  return(bwd_list)
}

mars(y ~ .,data=data)

testdata=data
rm(data)
mars(y ~., data=testdata)
traceback()

# add data because" testdata=data " not work

mars<-function(formula, data, control){
  fwd_out<-fwd_stepwise(formula,data)
  bwd_out<-bwd_stepwise(fwd_out,data)
  return(bwd_out)
}

bwd_stepwise<-function(bwd_in,data){ 
  bwd_list<-step(bwd_in,data)
  return(bwd_list)
}

mars(y ~ .,data=data)

testdata=data
rm(data)
mars(y ~., data=testdata)
traceback()
