/*******************************************************************************
 * Copyright (c) 2012, Jean-David Gadina - www.xs-labs.com
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 *  -   Redistributions of source code must retain the above copyright notice,
 *      this list of conditions and the following disclaimer.
 *  -   Redistributions in binary form must reproduce the above copyright
 *      notice, this list of conditions and the following disclaimer in the
 *      documentation and/or other materials provided with the distribution.
 *  -   Neither the name of 'Jean-David Gadina' nor the names of its
 *      contributors may be used to endorse or promote products derived from
 *      this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 ******************************************************************************/
 
/* $Id$ */

#import "CEInfoWindowController+NSOutlineViewDelegate.h"
#import "CEInfoWindowController+Private.h"
#import "CEInfoWindowCell.h"

@implementation CEInfoWindowController( NSOutlineViewDelegate )

/*
- ( NSView * )outlineView: ( NSOutlineView * )outlineView viewForTableColumn: ( NSTableColumn * )tableColumn item: ( id )item
{
    ( void )outlineView;
    ( void )tableColumn;
    
    return item;
}
*/

- ( NSCell * )outlineView: ( NSOutlineView * )outlineView dataCellForTableColumn: ( NSTableColumn * )tableColumn item: ( id )item
{
    CEInfoWindowCell * cell;
    
    ( void )outlineView;
    ( void )tableColumn;
    
    cell = [ [ CEInfoWindowCell alloc ] init ];
    
    cell.view = item;
    
    return [ cell autorelease ];
}

- ( void )outlineView:(NSOutlineView *)outlineView willDisplayCell: ( id )cell forTableColumn: ( NSTableColumn * )tableColumn item: ( id )item
{
    ( void )outlineView;
    ( void )tableColumn;
    
    ( ( CEInfoWindowCell * )cell ).view = item;
}

- ( BOOL )outlineView: ( NSOutlineView * )outlineView shouldSelectItem: ( id )item
{
    ( void )outlineView;
    ( void )item;
    
    return NO;
}

- ( CGFloat )outlineView: ( NSOutlineView * )outlineView heightOfRowByItem: ( id )item
{
    ( void )outlineView;
    
    if( [ item isKindOfClass: [ NSView class ] ] == NO )
    {
        return 0;
    }
    
    return ( ( NSView * )item ).frame.size.height;
}

- ( void )outlineViewItemWillCollapse: ( NSNotification * )notification
{
    ( void )notification;
    
    [ self resizeWindow: YES ];
}

- ( void )outlineViewItemWillExpand: ( NSNotification * )notification
{
    ( void )notification;
    
    [ self resizeWindow: YES ];
}

@end
