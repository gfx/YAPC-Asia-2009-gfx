#define PERL_NO_GET_CONTEXT
#include <EXTERN.h>
#include <perl.h>
#include <XSUB.h>

#ifdef USE_PPPORT
#include "ppport.h"
#endif

static void
do_something_to_hv(HV* const hv PERL_UNUSED_DECL){
    NOOP;
}

#define do_something_to_hashref_wrong    do_something_to_hv
#define do_something_to_hashref_correct  do_something_to_hv

typedef HV* HVREF;

MODULE = Magic::Example	PACKAGE = Magic::Example

PROTOTYPES: DISABLE

void
do_something_to_hashref_wrong(HV* hv)

void
do_something_to_hashref_correct(HVREF hv)

