#define PERL_NO_GET_CONTEXT
#include <EXTERN.h>
#include <perl.h>
#include <XSUB.h>

#ifdef USE_PPPORT
#include "ppport.h"
#endif

static int
watch_get(pTHX_ SV* const sv PERL_UNUSED_DECL, MAGIC* const mg){
    warn("get for %"SVf, mg->mg_ptr);

    return 0;
}

static int
watch_set(pTHX_ SV* const sv PERL_UNUSED_DECL, MAGIC* const mg){
    warn("set for %"SVf, mg->mg_ptr);

    return 0;
}

static U32
watch_len(pTHX_ SV* const sv PERL_UNUSED_DECL, MAGIC* const mg){
    warn("len for %"SVf, mg->mg_ptr);

    return 42;
}

static int
watch_clear(pTHX_ SV* const sv PERL_UNUSED_DECL, MAGIC* const mg){
    warn("clear for %"SVf, mg->mg_ptr);

    return 0;
}

static int
watch_free(pTHX_ SV* const sv PERL_UNUSED_DECL, MAGIC* const mg){
    warn("free for %"SVf, mg->mg_ptr);

    return 0;
}

static int
watch_copy(pTHX_ SV* const sv PERL_UNUSED_DECL, MAGIC* const mg,
         SV* const new_elem PERL_UNUSED_DECL, const char* const name, int const namelen){

    if(namelen == HEf_SVKEY){
        warn("copy for %"SVf" (name sv=%"SVf")", mg->mg_ptr, name);
    }
    else{
        warn("copy for %"SVf" (name=%s, namelen=%d)", mg->mg_ptr, name, namelen);
    }

    return 0;
}

static int
watch_dup(pTHX_ MAGIC* const mg, CLONE_PARAMS* const param){
#ifdef USE_ITHREADS
    Perl_warn(param->proto_perl, "dup for %"SVf, mg->mg_ptr);
#endif
    return 0;
}

static int
watch_local(pTHX_ SV* const new_sv, MAGIC* const mg){
    warn("local for %"SVf" (new sv: %s=0x%p)", mg->mg_ptr,
        sv_reftype(new_sv, FALSE), new_sv);

    return 0;
}


MGVTBL watch_vtbl = {
	watch_get,
	watch_set,
	watch_len,
	watch_clear,
	watch_free,
	watch_copy,
	watch_dup,
#ifdef MGf_LOCAL
	watch_local,
#endif
};

typedef SV* SVREF;


MODULE = Magic::Watch	PACKAGE = Magic::Watch

PROTOTYPES: DISABLE

void
attach(SVREF sv, SV* name)
PROTOTYPE: \[$@%]$
PREINIT:
    MAGIC* mg;
CODE:
    mg = sv_magicext(sv, NULL, PERL_MAGIC_ext, &watch_vtbl, (char*)sv_2mortal(newSVsv(name)), HEf_SVKEY);
    mg->mg_flags |= (MGf_COPY | MGf_DUP | MGf_LOCAL);
    //mg->mg_flags &= ~MGf_COPY; /* copy is too hard to deal with */

