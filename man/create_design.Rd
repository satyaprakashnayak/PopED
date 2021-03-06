% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/create_design.R
\name{create_design}
\alias{create_design}
\title{Create design variables for a full description of a design.}
\usage{
create_design(xt, groupsize, m = NULL, x = NULL, a = NULL, ni = NULL,
  model_switch = NULL)
}
\arguments{
\item{xt}{Matrix defining the  sampling schedule.
Each row is a group.}

\item{groupsize}{Vector defining the  size of the different groups (number of individuals in each group).}

\item{m}{A number defining the  number of groups. Computed from xt if not defined.}

\item{x}{A matrix defining the  discrete design variables for the model
Each row is a group.}

\item{a}{Matrix defining the  continuous design variables. Each row is a group.}

\item{ni}{Vector defining the number of samples for each group, computed as all elements of xt for each group by default.}

\item{model_switch}{Matrix defining which response a certain sampling time belongs to. Defaults to one for all elements of xt.}
}
\description{
Create design variables to fully describe a design.
If variables are supplied then these variables are checked for
consistency and, if possible, changed to sizes that make
sense if there are inconsistencies.
Returns a list of matricies compatible with PopED.
}
\details{
If a value (or a vector/list of values) is supplied that correponds to only one group and the design has
multiple groups then all groups will have the same value(s). If a matrix is expected then a list of lists can be supplied
instead, each list corresponding to a group.
}
\examples{
library(PopED)

xt1 <- list(c(1,2,3),c(1,2,3,4))
xt4 <- list(c(1,2,3,4,5),c(1,2,3,4))
xt2 <- rbind(c(1,2,3,4),c(1,2,3,4))
xt3 <- c(1,2,3,4)

design_1 <- create_design(xt=xt1,groupsize=20)
design_2 <- create_design(xt=xt4,groupsize=20)
design_3 <- create_design(xt=xt2,groupsize=20)
design_4 <- create_design(xt=xt3,groupsize=20)

design_5 <- create_design(xt=xt3,groupsize=20,m=3)

design_6 <- create_design(xt=xt1,groupsize=20,model_switch=ones(2,4))

design_7 <-create_design(xt=xt1,groupsize=20,a=c(2,3,4))
design_8 <-create_design(xt=xt1,groupsize=20,a=rbind(c(2,3,4),c(4,5,6)))
design_9 <-create_design(xt=xt1,groupsize=20,a=list(c(2,3,4,6),c(4,5,6)))
design_10 <-create_design(xt=xt1,groupsize=20,a=list(c(2,3,4),c(4,5,6)))

design_11 <-create_design(xt=c(0,1,2,4,6,8,24),
                         groupsize=50,
                         a=c(WT=70,DOSE=1000))

design_12 <-create_design(xt=c(0,1,2,4,6,8,24),
                         groupsize=50,
                         a=c(WT=70,DOSE=1000),m=2)

design_13 <-create_design(xt=c(0,1,2,4,6,8,24),
                         groupsize=50,
                         a=list(c(WT=70,DOSE=1000),c(DOSE=90,WT=200,AGE=45)),m=2)

design_14 <-create_design(xt=c(0,1,2,4,6,8,24),
                         groupsize=50,
                         a=list(list(WT=70,DOSE=1000),list(DOSE=90,WT=200,AGE=45)),m=2)

design_15 <-create_design(xt=xt4,
                          groupsize=c(50,20),
                          a=rbind(c("DOSE"=2,"WT"=3,"AGE"=4),
                                  c(4,5,6)))

}
\seealso{
Other poped_input: \code{\link{convert_variables}};
  \code{\link{create.poped.database}};
  \code{\link{create_design_space}};
  \code{\link{downsizing_general_design}};
  \code{\link{poped.choose}}
}

