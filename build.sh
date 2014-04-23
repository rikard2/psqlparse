#!/bin/bash -e
gcc -O2 -Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard -L../../src/port -L../../src/common -Wl,--as-needed -Wl,--enable-new-dtags  -Wl,-E access/common/heaptuple.o access/common/indextuple.o access/common/printtup.o access/common/reloptions.o access/common/scankey.o access/common/tupconvert.o access/common/tupdesc.o access/gin/ginutil.o access/gin/gininsert.o access/gin/ginxlog.o access/gin/ginentrypage.o access/gin/gindatapage.o access/gin/ginbtree.o access/gin/ginscan.o access/gin/ginget.o access/gin/ginvacuum.o access/gin/ginarrayproc.o access/gin/ginbulk.o access/gin/ginfast.o access/gin/ginpostinglist.o access/gin/ginlogic.o access/gist/gist.o access/gist/gistutil.o access/gist/gistxlog.o access/gist/gistvacuum.o access/gist/gistget.o access/gist/gistscan.o access/gist/gistproc.o access/gist/gistsplit.o access/gist/gistbuild.o access/gist/gistbuildbuffers.o access/hash/hash.o access/hash/hashfunc.o access/hash/hashinsert.o access/hash/hashovfl.o access/hash/hashpage.o access/hash/hashscan.o access/hash/hashsearch.o access/hash/hashsort.o access/hash/hashutil.o access/heap/heapam.o access/heap/hio.o access/heap/pruneheap.o access/heap/rewriteheap.o access/heap/syncscan.o access/heap/tuptoaster.o access/heap/visibilitymap.o access/index/genam.o access/index/indexam.o access/nbtree/nbtcompare.o access/nbtree/nbtinsert.o access/nbtree/nbtpage.o access/nbtree/nbtree.o access/nbtree/nbtsearch.o access/nbtree/nbtutils.o access/nbtree/nbtsort.o access/nbtree/nbtxlog.o access/rmgrdesc/clogdesc.o access/rmgrdesc/dbasedesc.o access/rmgrdesc/gindesc.o access/rmgrdesc/gistdesc.o access/rmgrdesc/hashdesc.o access/rmgrdesc/heapdesc.o access/rmgrdesc/mxactdesc.o access/rmgrdesc/nbtdesc.o access/rmgrdesc/relmapdesc.o access/rmgrdesc/seqdesc.o access/rmgrdesc/smgrdesc.o access/rmgrdesc/spgdesc.o access/rmgrdesc/standbydesc.o access/rmgrdesc/tblspcdesc.o access/rmgrdesc/xactdesc.o access/rmgrdesc/xlogdesc.o access/spgist/spgutils.o access/spgist/spginsert.o access/spgist/spgscan.o access/spgist/spgvacuum.o access/spgist/spgdoinsert.o access/spgist/spgxlog.o access/spgist/spgtextproc.o access/spgist/spgquadtreeproc.o access/spgist/spgkdtreeproc.o access/transam/clog.o access/transam/transam.o access/transam/varsup.o access/transam/xact.o access/transam/rmgr.o access/transam/slru.o access/transam/subtrans.o access/transam/multixact.o access/transam/timeline.o access/transam/twophase.o access/transam/twophase_rmgr.o access/transam/xlog.o access/transam/xlogarchive.o access/transam/xlogfuncs.o access/transam/xlogreader.o access/transam/xlogutils.o bootstrap/bootparse.o bootstrap/bootstrap.o catalog/catalog.o catalog/dependency.o catalog/heap.o catalog/index.o catalog/indexing.o catalog/namespace.o catalog/aclchk.o catalog/objectaccess.o catalog/objectaddress.o catalog/pg_aggregate.o catalog/pg_collation.o catalog/pg_constraint.o catalog/pg_conversion.o catalog/pg_depend.o catalog/pg_enum.o catalog/pg_inherits.o catalog/pg_largeobject.o catalog/pg_namespace.o catalog/pg_operator.o catalog/pg_proc.o catalog/pg_range.o catalog/pg_db_role_setting.o catalog/pg_shdepend.o catalog/pg_type.o catalog/storage.o catalog/toasting.o parser/analyze.o parser/gram.o parser/keywords.o parser/kwlookup.o parser/parser.o parser/parse_agg.o parser/parse_clause.o parser/parse_coerce.o parser/parse_collate.o parser/parse_cte.o parser/parse_expr.o parser/parse_func.o parser/parse_node.o parser/parse_oper.o parser/parse_param.o parser/parse_relation.o parser/parse_target.o parser/parse_type.o parser/parse_utilcmd.o parser/scansup.o commands/aggregatecmds.o commands/alter.o commands/analyze.o commands/async.o commands/cluster.o commands/comment.o commands/collationcmds.o commands/constraint.o commands/conversioncmds.o commands/copy.o commands/createas.o commands/dbcommands.o commands/define.o commands/discard.o commands/dropcmds.o commands/event_trigger.o commands/explain.o commands/extension.o commands/foreigncmds.o commands/functioncmds.o commands/indexcmds.o commands/lockcmds.o commands/matview.o commands/operatorcmds.o commands/opclasscmds.o commands/portalcmds.o commands/prepare.o commands/proclang.o commands/schemacmds.o commands/seclabel.o commands/sequence.o commands/tablecmds.o commands/tablespace.o commands/trigger.o commands/tsearchcmds.o commands/typecmds.o commands/user.o commands/vacuum.o commands/vacuumlazy.o commands/variable.o commands/view.o executor/execAmi.o executor/execCurrent.o executor/execGrouping.o executor/execJunk.o executor/execMain.o executor/execProcnode.o executor/execQual.o executor/execScan.o executor/execTuples.o executor/execUtils.o executor/functions.o executor/instrument.o executor/nodeAppend.o executor/nodeAgg.o executor/nodeBitmapAnd.o executor/nodeBitmapOr.o executor/nodeBitmapHeapscan.o executor/nodeBitmapIndexscan.o executor/nodeHash.o executor/nodeHashjoin.o executor/nodeIndexscan.o executor/nodeIndexonlyscan.o executor/nodeLimit.o executor/nodeLockRows.o executor/nodeMaterial.o executor/nodeMergeAppend.o executor/nodeMergejoin.o executor/nodeModifyTable.o executor/nodeNestloop.o executor/nodeFunctionscan.o executor/nodeRecursiveunion.o executor/nodeResult.o executor/nodeSeqscan.o executor/nodeSetOp.o executor/nodeSort.o executor/nodeUnique.o executor/nodeValuesscan.o executor/nodeCtescan.o executor/nodeWorktablescan.o executor/nodeGroup.o executor/nodeSubplan.o executor/nodeSubqueryscan.o executor/nodeTidscan.o executor/nodeForeignscan.o executor/nodeWindowAgg.o executor/tstoreReceiver.o executor/spi.o foreign/foreign.o lib/ilist.o lib/binaryheap.o lib/stringinfo.o libpq/be-fsstubs.o libpq/be-secure.o libpq/auth.o libpq/crypt.o libpq/hba.o libpq/ip.o libpq/md5.o libpq/pqcomm.o libpq/pqformat.o libpq/pqsignal.o nodes/nodeFuncs.o nodes/nodes.o nodes/list.o nodes/bitmapset.o nodes/tidbitmap.o nodes/copyfuncs.o nodes/equalfuncs.o nodes/makefuncs.o nodes/outfuncs.o nodes/readfuncs.o nodes/print.o nodes/read.o nodes/params.o nodes/value.o optimizer/geqo/geqo_copy.o optimizer/geqo/geqo_eval.o optimizer/geqo/geqo_main.o optimizer/geqo/geqo_misc.o optimizer/geqo/geqo_mutation.o optimizer/geqo/geqo_pool.o optimizer/geqo/geqo_random.o optimizer/geqo/geqo_recombination.o optimizer/geqo/geqo_selection.o optimizer/geqo/geqo_erx.o optimizer/geqo/geqo_pmx.o optimizer/geqo/geqo_cx.o optimizer/geqo/geqo_px.o optimizer/geqo/geqo_ox1.o optimizer/geqo/geqo_ox2.o optimizer/path/allpaths.o optimizer/path/clausesel.o optimizer/path/costsize.o optimizer/path/equivclass.o optimizer/path/indxpath.o optimizer/path/joinpath.o optimizer/path/joinrels.o optimizer/path/pathkeys.o optimizer/path/tidpath.o optimizer/plan/analyzejoins.o optimizer/plan/createplan.o optimizer/plan/initsplan.o optimizer/plan/planagg.o optimizer/plan/planmain.o optimizer/plan/planner.o optimizer/plan/setrefs.o optimizer/plan/subselect.o optimizer/prep/prepjointree.o optimizer/prep/prepqual.o optimizer/prep/prepsecurity.o optimizer/prep/preptlist.o optimizer/prep/prepunion.o optimizer/util/clauses.o optimizer/util/joininfo.o optimizer/util/orclauses.o optimizer/util/pathnode.o optimizer/util/placeholder.o optimizer/util/plancat.o optimizer/util/predtest.o optimizer/util/relnode.o optimizer/util/restrictinfo.o optimizer/util/tlist.o optimizer/util/var.o port/dynloader.o port/pg_sema.o port/pg_shmem.o port/pg_latch.o postmaster/autovacuum.o postmaster/bgworker.o postmaster/bgwriter.o postmaster/checkpointer.o postmaster/fork_process.o postmaster/pgarch.o postmaster/pgstat.o postmaster/postmaster.o postmaster/startup.o postmaster/syslogger.o postmaster/walwriter.o regex/regcomp.o regex/regerror.o regex/regexec.o regex/regfree.o regex/regprefix.o regex/regexport.o replication/logical/decode.o replication/logical/logical.o replication/logical/logicalfuncs.o replication/logical/reorderbuffer.o replication/logical/snapbuild.o replication/walsender.o replication/walreceiverfuncs.o replication/walreceiver.o replication/basebackup.o replication/repl_gram.o replication/slot.o replication/slotfuncs.o replication/syncrep.o rewrite/rewriteRemove.o rewrite/rewriteDefine.o rewrite/rewriteHandler.o rewrite/rewriteManip.o rewrite/rewriteSupport.o storage/buffer/buf_table.o storage/buffer/buf_init.o storage/buffer/bufmgr.o storage/buffer/freelist.o storage/buffer/localbuf.o storage/file/fd.o storage/file/buffile.o storage/file/copydir.o storage/file/reinit.o storage/freespace/freespace.o storage/freespace/fsmpage.o storage/freespace/indexfsm.o storage/ipc/dsm_impl.o storage/ipc/dsm.o storage/ipc/ipc.o storage/ipc/ipci.o storage/ipc/pmsignal.o storage/ipc/procarray.o storage/ipc/procsignal.o storage/ipc/shmem.o storage/ipc/shmqueue.o storage/ipc/shm_mq.o storage/ipc/shm_toc.o storage/ipc/sinval.o storage/ipc/sinvaladt.o storage/ipc/standby.o storage/large_object/inv_api.o storage/lmgr/lmgr.o storage/lmgr/lock.o storage/lmgr/proc.o storage/lmgr/deadlock.o storage/lmgr/lwlock.o storage/lmgr/spin.o storage/lmgr/s_lock.o storage/lmgr/predicate.o storage/page/bufpage.o storage/page/checksum.o storage/page/itemptr.o storage/smgr/md.o storage/smgr/smgr.o storage/smgr/smgrtype.o tcop/dest.o tcop/fastpath.o tcop/postgres.o tcop/pquery.o tcop/utility.o tsearch/ts_locale.o tsearch/ts_parse.o tsearch/wparser.o tsearch/wparser_def.o tsearch/dict.o tsearch/dict_simple.o tsearch/dict_synonym.o tsearch/dict_thesaurus.o tsearch/dict_ispell.o tsearch/regis.o tsearch/spell.o tsearch/to_tsany.o tsearch/ts_selfuncs.o tsearch/ts_typanalyze.o tsearch/ts_utils.o utils/adt/acl.o utils/adt/arrayfuncs.o utils/adt/array_selfuncs.o utils/adt/array_typanalyze.o utils/adt/array_userfuncs.o utils/adt/arrayutils.o utils/adt/ascii.o utils/adt/bool.o utils/adt/cash.o utils/adt/char.o utils/adt/date.o utils/adt/datetime.o utils/adt/datum.o utils/adt/dbsize.o utils/adt/domains.o utils/adt/encode.o utils/adt/enum.o utils/adt/float.o utils/adt/format_type.o utils/adt/formatting.o utils/adt/genfile.o utils/adt/geo_ops.o utils/adt/geo_selfuncs.o utils/adt/inet_cidr_ntop.o utils/adt/inet_net_pton.o utils/adt/int.o utils/adt/int8.o utils/adt/json.o utils/adt/jsonb.o utils/adt/jsonb_gin.o utils/adt/jsonb_op.o utils/adt/jsonb_util.o utils/adt/jsonfuncs.o utils/adt/like.o utils/adt/lockfuncs.o utils/adt/mac.o utils/adt/misc.o utils/adt/nabstime.o utils/adt/name.o utils/adt/network.o utils/adt/network_gist.o utils/adt/network_selfuncs.o utils/adt/numeric.o utils/adt/numutils.o utils/adt/oid.o utils/adt/oracle_compat.o utils/adt/orderedsetaggs.o utils/adt/pg_lzcompress.o utils/adt/pg_locale.o utils/adt/pg_lsn.o utils/adt/pgstatfuncs.o utils/adt/pseudotypes.o utils/adt/quote.o utils/adt/rangetypes.o utils/adt/rangetypes_gist.o utils/adt/rangetypes_selfuncs.o utils/adt/rangetypes_spgist.o utils/adt/rangetypes_typanalyze.o utils/adt/regexp.o utils/adt/regproc.o utils/adt/ri_triggers.o utils/adt/rowtypes.o utils/adt/ruleutils.o utils/adt/selfuncs.o utils/adt/tid.o utils/adt/timestamp.o utils/adt/trigfuncs.o utils/adt/tsginidx.o utils/adt/tsgistidx.o utils/adt/tsquery.o utils/adt/tsquery_cleanup.o utils/adt/tsquery_gist.o utils/adt/tsquery_op.o utils/adt/tsquery_rewrite.o utils/adt/tsquery_util.o utils/adt/tsrank.o utils/adt/tsvector.o utils/adt/tsvector_op.o utils/adt/tsvector_parser.o utils/adt/txid.o utils/adt/uuid.o utils/adt/varbit.o utils/adt/varchar.o utils/adt/varlena.o utils/adt/version.o utils/adt/windowfuncs.o utils/adt/xid.o utils/adt/xml.o utils/cache/attoptcache.o utils/cache/catcache.o utils/cache/evtcache.o utils/cache/inval.o utils/cache/plancache.o utils/cache/relcache.o utils/cache/relmapper.o utils/cache/relfilenodemap.o utils/cache/spccache.o utils/cache/syscache.o utils/cache/lsyscache.o utils/cache/typcache.o utils/cache/ts_cache.o utils/error/assert.o utils/error/elog.o utils/fmgr/dfmgr.o utils/fmgr/fmgr.o utils/fmgr/funcapi.o utils/hash/dynahash.o utils/hash/hashfn.o utils/init/globals.o utils/init/miscinit.o utils/init/postinit.o utils/mb/encnames.o utils/mb/conv.o utils/mb/mbutils.o utils/mb/wchar.o utils/mb/wstrcmp.o utils/mb/wstrncmp.o utils/misc/guc.o utils/misc/help_config.o utils/misc/pg_rusage.o utils/misc/ps_status.o utils/misc/rbtree.o utils/misc/superuser.o utils/misc/timeout.o utils/misc/tzparser.o utils/mmgr/aset.o utils/mmgr/mcxt.o utils/mmgr/portalmem.o utils/resowner/resowner.o utils/sort/logtape.o utils/sort/sortsupport.o utils/sort/tuplesort.o utils/sort/tuplestore.o utils/time/combocid.o utils/time/tqual.o utils/time/snapmgr.o utils/fmgrtab.o ../../src/timezone/localtime.o ../../src/timezone/strftime.o ../../src/timezone/pgtz.o ../../src/port/libpgport_srv.a ../../src/common/libpgcommon_srv.a -lrt -lcrypt -ldl -lm queryparser.c  -I../include -o queryparser
