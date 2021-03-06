
[![Build
Status](https://travis-ci.org/ices-tools-prod/icesSharePoint.svg?branch=master)](https://travis-ci.org/ices-tools-prod/icesSharePoint)

[<img align="right" alt="ICES Logo" width="17%" height="17%" src="http://www.ices.dk/_layouts/15/1033/images/icesimg/iceslogo.png">](http://www.ices.dk/Pages/default.aspx)

# icesSharePoint

icesSharePoint provides helper functions to access the SharePoint site
used by [ICES](http://www.ices.dk/Pages/default.aspx).

<!-- icesSharePoint is implemented as an [R](https://www.r-project.org) package and
available on [CRAN](https://cran.r-project.org/package=icesSharePoint). -->

Before you can access the SharePoint via R, you must have a valid user
name and password given to you by the ICES Secretariate. icesSharePoint
requires your ICES username and password to be saved in environment
variables, see for example, Appendix: Storing API Authentication
Keys/Tokens in the [httr package
vignette](https://cran.r-project.org/web/packages/httr/vignettes/api-packages.html).
The first time you use the API, the package will create an appropriate
file (‘\~/.Renviron\_SP’) to contain your username and password. It is
important that this file is in a private location in your computer, such
as your home drive ‘\~’. Your password is never sent to the API, but is
used to authenticate via
[ntlm](http://davenport.sourceforge.net/ntlm.html).

## Installation

icesSharePoint can be installed from GitHub using the `install_github`
command from the `devtools` package:

``` r
library(devtools)
install_github("ices-tools-prod/icesSharePoint")
```

## Usage

For a summary of the package:

``` r
library(icesSharePoint)
?icesSharePoint
```

## Basic example

First of all you need to set your ices username for the session, this is
done like so:

``` r
# set ices username
options(icesSharePoint.username = <your ices login name>)
# check it has worked
options("icesSharePoint.username")
```

A first call to anything will ask you for a password, for example:

``` r
spdir()
```

there after it will be stored in a secrets store that only you have
access to. However be carefull because if someone gains access to your
computer your password will be accessible via:

``` r
keyring::key_get("icesSharePoint", "colin") # beware!! this will print your password to the screen
```

You need to be logged into your machine as you to read this, but if
someone somehow wrote a dodgy script, they could programatically access
your password…. so beware\!

You can clear the password at the end of the session with this:

``` r
icesSharePoint:::SP_clearpassword() # which just calls
```

The next step is set the site you are accessing to save supplying it in
all the function calls, this exmaple uses WGMIXFISH-ADVICE sharepoint
site. Only ices users who have been granted access can access this
folder.

``` r
options(icesSharePoint.site = "/ExpertGroups/WGMIXFISH-ADVICE")
```

Now find the directory you want to access

``` r
# this prints the directory contents, and is useful to navigate to find the
# directory or file you are interested in
spdir()
spdir("2020 Meeting Documents")
# etc
spdir("2020 Meeting Documents/06. Data/FIDES")
```

Now that you know the directory you want to acces, you can loop over all
the files and download them one by one. Single files can also be
accessed in a similar way

``` r
fnames <- spfiles("2020 Meeting Documents/06. Data/FIDES", full = TRUE)
for (fname in fnames) {
  spgetfile(fname, destdir = ".")
}
```

You can also download the file in one line and specify the site you want
to access from the `spgetfile` function. Another useful point of note is
the `destdir` argument. by default files are downloaded in the same
folder structure as they are on the sharepoint, but destdir overrides
this.

``` r
spgetfile(
  "2021 Meeting Documents/06. Data/Iberian Waters/ANK2020.xlsx",
  site = "/ExpertGroups/WGMIXFISH-ADVICE",
  destdir = "."
)
```

## References

ICES Community SharePoint site:

<https://community.ices.dk/SitePages/Home.aspx>

Microsoft SharePoint 2013 REST interface reference

<https://msdn.microsoft.com/en-us/library/office/jj860569.aspx>

## Development

icesSharePoint is developed openly on
[GitHub](https://github.com/ices-tools-prod/icesSharePoint).

Feel free to open an
[issue](https://github.com/ices-tools-prod/icesSharePoint/issues) there
if you encounter problems or have suggestions for future versions.

<!--
The current development version can be installed using:

```R
library(devtools)
install_github("ices-tools-prod/icesSharePoint")
```
-->

<!-- Poke Travis -->
