################################################################################
#
# db.tcl --
#
#     This package provides an API that wraps the ns_db API for ease of use.
#     The nsdb.so is required.
#
# $Id:$
#
# Best Practices:
#
#     It is important to catch the complete operation in order to rollback the
#     transaction and release the handle. This example then explicitly thows
#     the error:
#
#     Example 1:
#
#     if {[catch {
#         ::nsdb::getHandle defaultPool dbHandle
#         ::nsdb::startTransaction $dbHandle
#         ::nsdb::dml $dbHandle "INSERT INTO table1... "
#         ::nsdb::getLastInsertId $dbHandle id
#         ::nsdb::dml $dbHandle "INSERT INTO table2... WHERE ID = ${id}"
#         ::nsdb::startCommitTransaction $dbHandle
#         ::nsdb::releaseHandle $dbHandle
#     } err]} {
#         catch {
#             ::nsdb::rollbackTransaction $dbHandle
#             ::nsdb::releaseHandle $dbHandle
#         }
#         error $err
#     }
#
#     Since we do not know where in the operation the error was - we catch both
#     the rollback and realease of the handle before thowing the original
#     error.
#
#     Example 2:
#
#     if {[catch {
#         ::nsdb::getHandle defaultPool dbHandle
#         ::nsdb::dml $dbHandle "UPDATE...."
#         ::nsdb::releaseHandle $dbHandle
#     } err]} {
#         catch {::nsdb::releaseHandle $dbHandle}
#         error $err
#     }
#
################################################################################
package provide nsdb 1.0.0
namespace eval ::nsdb {}


################################################################################
#
# ::nsdb::getHandle --
#
#     Gets a handle from the specified pool and upvars it into 
#     dbHandleVarName.
#
# Arguments:
#     poolName: The name of the pool as set in the nsdb.so config sections.
#     dbHandleVarName: The name of the variable in which to set the handle.
#      
#
# Results:
#     Gets a handle from the specified pool and upvars it into 
#     dbHandleVarName. Returns 1 if the var was successfully set.
#     If there are no hadles left in the pool an error is thrown.
#
# See Also:
#     ns_db gethandle
#     nsdb.so config
#
################################################################################
proc ::nsdb::getHandle {poolName dbHandleVarName} {
    upvar $dbHandleVarName dbHandle
    set dbHandle [ns_db gethandle $poolName 1]
    ns_log debug "::nsdb::getHandle: ${poolName}: ${dbHandle}"
    return 1
}


################################################################################
#
# ::nsdb::releaseHandle --
#
#     Returns the specified handle to the pool.
#
# Arguments:
#     dbHandle: The name of the db handle as returned by ::wsa::db:getHandle.
#
# Results:
#     Returns the handle back to the db pool. Returns 1 or throws an error.
#
# See Also:
#     ns_db releasehandle
#     nsdb.so
#
################################################################################
proc ::nsdb::releaseHandle {dbHandle} {
    ns_log debug "::nsdb::releaseHandle: ${dbHandle}"
    ns_db releasehandle $dbHandle
    return 1
}


################################################################################
#
# ::nsdb::startTransaction --
#
#     Uses ::nsdb::dml to send "START TRANSACTION" through $dbHandle.
#
# Arguments:
#     dbHandle: The handle through which to send the dml.
#
# Restuls:
#     Returns the result of ::nsdb::dml.
#
# See Also:
#     ::nsdb::dml
#
################################################################################
proc ::nsdb::startTransaction {dbHandle} {
    return [::nsdb:::dml $dbHandle "START TRANSACTION"]
}


################################################################################
#
# ::nsdb::commitTransaction --
#
#     Uses ::nsdb::dml to send "COMMIT" through $dbHandle.
#
# Arguments:
#     dbHandle: The handle through which to send the command.
#
# Restuls:
#     Returns the result of ::nsdb::dml.
#
# See Also:
#     ::nsdb::dml
#
################################################################################
proc ::nsdb::commitTransaction {dbHandle} {
    return [::nsdb::dml $dbHandle "COMMIT"]
}


################################################################################
#
# ::nsdb::rollbackTransaction --
#
#     Uses ::nsdb::dml to send "ROLLBACK" through $dbHandle.
#
# Arguments:
#     dbHandle: The handle through which to send the command.
#
# Restuls:
#     Returns the result of ::nsdb::dml.
#
# See Also:
#     ::nsdb::dml
#
################################################################################
proc ::nsdb::rollbackTransaction {dbHandle} {
    return [::nsdb::dml $dbHandle "ROLLBACK"]
}


################################################################################
# 
# ::nsdb::dml --
#
#    Uses ns_db dml to send dml though $dbHandle.
#
# Arguments:
#     dbHandle: The handle through which to send the dml: db0
#     dml: The dml: "DELETE FROM foo WHERE id = 1"
#
# Results:
#     The dml is sent and executed. Returns the result of ns_db dml.
#
# See Also:
#     ns_db dml
#
################################################################################
proc ::nsdb::dml {dbHandle dml} {
    ns_log debug "::nsdb::dml: ${dbHandle}: ${dml}"
    return [ns_db dml $dbHandle $dml]
}


################################################################################
#
# ::nsdb::getLastInsertId --
#
#    Returns the value generated for an AUTO_INCREMENT column by the previous 
#    INSERT or UPDATE statement. Use this proc after you have performed an 
#    INSERT statement into a table that contains an AUTO_INCREMENT field. 
#    See the USAGE section below.
#
# Arguments:
#     dbHandle: The handle through which to send the request: E.g., db0
#
# Results:
#     Sets the value generated for an AUTO_INCREMENT column by the previous
#     INSERT or UPDATE statement in $idVarName;  returns 1.
#
# Usage:
#     It is important to catch the complete operation in order to rollback the
#     transaction and release the handle. This example then explicitly thows
#     the error.
#
#     if {[catch {
#         ::nsdb::getHandle defaultPool dbHandle
#         ::nsdb::startTransaction $dbHandle
#         ::nsdb::dml $dbHandle "INSERT INTO table1... "
#         ::nsdb::getLastInsertId $dbHandle id
#         ::nsdb::dml $dbHandle "INSERT INTO table2... WHERE ID = ${id}"
#         ::nsdb::startCommitTransaction $dbHandle
#         ::nsdb::releaseHandle $dbHandle
#     } err]} 
#         catch {
#             ::nsdb::rollbackTransaction $dbHandle
#             ::nsdb::releaseHandle $dbHandle
#         }
#         error $err
#     }
#     
# See Also:
#     ns_db 0or1row
#     ns_set
#
################################################################################
proc ::nsdb::getLastInsertId {dbHandle idVarName} {
    upvar $idVarName id

    set selectSQL "SELECT LAST_INSERT_ID()"

    if {[catch {
        set nsSetId [ns_db 0or1row $dbHandle $selectSQL]
        set id [ns_set get $nsSetId LAST_INSERT_ID()]
        ns_set free $nsSetId
    } err]} {
        catch {ns_set free $nsSetId}
        error $err
    }

    ns_log debug "::nsdb::getLastInsertId: ${id}"
    return 1
}


################################################################################
#
# ::nsdb::get0or1row --
#
#     Used to return 0 or 1 rows from a database.
#
# Arguments:
#     dbHandle: The handle through which to send the request: E.g., db0.
#     sqL: The sql to execute: E.g., SELECT * FROM foo WHERE id=1.
#     resultListVarName: The var name to set the result in.
#
# Results:
#     Set the sql result in $resultListVarName an returns 1. If no rows were
#     found, $resultListVarName is not set and 0 is returned. The value
#     of $resultListVarName is a Tcl list in the following format:
#        
#         [list field value field value...]
#
# See Also:
#     ns_db 0or1row
#     ns_set
#
################################################################################
proc ::nsdb::get0or1row {dbHandle sql resultListVarName} {
    upvar $resultListVarName resultList

    ns_log debug "::nsdb::get0or1row: ${dbHandle}: ${sql}"
    set nsSetId [ns_db 0or1row $dbHandle $sql]

    if {![string length $nsSetId]} {
        return 0
    }

    for {set x 0} {$x < [ns_set size $nsSetId]} {incr x} {
        lappend resultList [ns_set key $nsSetId $x] [ns_set value $nsSetId $x]
    }

    ns_set free $nsSetId
    return 1
}


################################################################################
#
# ::nsdb::getRows --
# 
#     Used to return 0 or 1 rows from a database.
#
# Arguments:
#     dbHandle: The handle through which to send the request: E.g., db0.
#     sqL: The sql to execute: E.g., SELECT * FROM foo
#     resultListVarName: The var name to set the result in.
#
# Results:
#     Set the sql result in $resultListVarName and returns the number of rows. 
#     If no rows were found, $resultListVarName is not set and 0 is returned.
#     The value of $resultListVarName is a Tcl list of lists in the following 
#     format:
#
#         [list [list field value field value...]...]
#
# See Also:
#     ns_db getrows
#     ns_set
#
################################################################################
proc ::nsdb::getRows {dbHandle sql resultListVarName} {
    upvar $resultListVarName resultList

    ns_log debug "::nsdb::getRows: ${sql}"
    set nsSetId [ns_db select $dbHandle $sql]

    while {[ns_db getrow $dbHandle $nsSetId]} {
        set thisRow [list]

        for {set x 0} {$x < [ns_set size $nsSetId]} {incr x} {
            lappend thisRow [ns_set key $nsSetId $x] [ns_set value $nsSetId $x]
        }

        lappend resultList $thisRow
    }

    ns_set free $nsSetId

    if {![info exists resultList]} {
        return 0
    }

    return [llength $resultList]
}

proc ::nsdb::doSelect {poolName sql} {
    if {[catch {
        ::nsdb::getHandle $poolName dbHandle
        ::nsdb::getRows $dbHandle $sql result
        ::nsdb::releaseHandle $dbHandle
    } error]} {
        catch {::nsdb::releaseHandle $dbHandle}
        error $error
    }

    if {![info exists result]} {
        return ""
    }

    return $result
}

proc ::nsdb::doDml {poolName dml} {

}
