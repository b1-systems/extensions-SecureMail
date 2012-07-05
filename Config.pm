# -*- Mode: perl; indent-tabs-mode: nil -*-
#
# The contents of this file are subject to the Mozilla Public
# License Version 1.1 (the "License"); you may not use this file
# except in compliance with the License. You may obtain a copy of
# the License at http://www.mozilla.org/MPL/
#
# Software distributed under the License is distributed on an "AS
# IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
# implied. See the License for the specific language governing
# rights and limitations under the License.
#
# The Original Code is the Bugzilla SecureMail Extension
#
# The Initial Developer of the Original Code is Mozilla.
# Portions created by Mozilla are Copyright (C) 2008 Mozilla Corporation.
# All Rights Reserved.
#
# Contributor(s): Max Kanat-Alexander <mkanat@bugzilla.org>
#                 Gervase Markham <gerv@gerv.net>

package Bugzilla::Extension::SecureMail;
use strict;

use Bugzilla::Constants;
use Bugzilla::Install::Util qw(vers_cmp);

use constant NAME => 'SecureMail';

sub REQUIRED_MODULES {
    my $modules = [
        {
            package => 'Crypt-OpenPGP',
            module  => 'Crypt::OpenPGP',
            # 1.02 added the ability for new() to take KeyRing objects for the
            # PubRing argument.
            version => '1.02',
        },
        {
            package => 'Crypt-SMIME',
            module  => 'Crypt::SMIME',
            version => 0,
        },
    ];
    if (vers_cmp(BUGZILLA_VERSION, '4.2') > -1) {
        push(@$modules, 
            {
                package => 'HTML-Tree', 
                module  => 'HTML::Tree', 
                version => 0, 
            }
        );
    }
    return $modules;
}

__PACKAGE__->NAME;
