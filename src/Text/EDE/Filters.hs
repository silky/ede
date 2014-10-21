-- Module      : Text.EDE.Filters
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | The means to construct your own filters.
module Text.EDE.Filters
    (
    -- * Prelude
    -- $prelude

    -- ** Boolean
    -- $boolean

    -- ** Equality
    -- $equality

    -- ** Relational
    -- $relational

    -- ** Numeric
    -- $numeric

    -- ** Fractional
    -- $fractional

    -- ** Textual
    -- $textual

    -- ** Collection
    -- $collection

    -- ** Polymorphic
    -- $polymorphic

    -- * Constructing filters
      Binding (..)

    -- ** Classes
    , Quote   (..)
    , Unquote (..)

    -- ** Restricted quoters
    , qapply
    , qpoly2
    , qnum1
    , qnum2
    , qcol1

    -- ** Errors
    , unexpected
    , typeOf
    ) where

import Text.EDE.Internal.HOAS

-- $prelude
--
-- The default filters available to a template is documented by the following categories.
--
-- These filters cannot be overriden and attempting to supply your own filters to
-- 'Text.EDE.renderWith' will cause the similarly named filters to disappear when
-- they are merged with the prelude during evaluation. (/See:/ 'Data.HashMap.Strict.union')

-- $boolean
--
-- * @!@  @:: Bool -> Bool@ (/See:/ 'not')
--
-- * '&&' @:: Bool -> Bool -> Bool@
--
-- * '||' @:: Bool -> Bool -> Bool@

-- $equality
--
-- * '==' @:: a -> a -> Bool@
--
-- * @!=@ @:: a -> a -> Bool@ (/See/: '/=')

-- $relational
--
-- * '>'  @:: a -> a -> Bool@
--
-- * '>=' @:: a -> a -> Bool@
--
-- * '<=' @:: a -> a -> Bool@
--
-- * '<=' @:: a -> a -> Bool@

-- $numeric
--
-- * '+'      @:: Number -> Number -> Number@
--
-- * '-'      @:: Number -> Number -> Number@
--
-- * '*'      @:: Number -> Number -> Number@
--
-- * 'abs'    @:: Number -> Number@
--
-- * 'signum' @:: Number -> Number@
--
-- * 'negate' @:: Number -> Number@

-- $fractional
--
-- * 'truncate' @:: Number -> Number@
--
-- * 'round'    @:: Number -> Number@
--
-- * 'ceiling'  @:: Number -> Number@
--
-- * 'floor'    @:: Number -> Number@

-- $textual
--
-- * @takeWord@  @:: Text -> Text@
--
-- * @dropWord@  @:: Text -> Text@
--
-- * @lowerHead@ @:: Text -> Text@
--
-- * @upperHead@ @:: Text -> Text@
--
-- * @toTitle@   @:: Text -> Text@
--
-- * @toCamel@   @:: Text -> Text@
--
-- * @toPascal@  @:: Text -> Text@
--
-- * @toSnake@   @:: Text -> Text@
--
-- * @toSpinal@  @:: Text -> Text@
--
-- * @toTrain@   @:: Text -> Text@
--
-- * @toLower@   @:: Text -> Text@
--
-- * @toUpper@   @:: Text -> Text@
--
-- * @toOrdinal@ @:: Number -> Text@
--
-- /See:/ <http://hackage.haskell.org/package/text-manipulate text-manipulate>

-- $collection
--
-- * @length@ @:: Collection -> Number@ (/See/: 'Data.Text.length', 'Data.Vector.length', 'Data.HashMap.Strict.size')
--
-- * @empty@  @:: Collection -> Bool@ (/See/: 'Data.Text.null', 'Data.Vector.null', 'Data.HashMap.Strict.null')

-- $polymorphic
--
-- * 'show' @:: a -> Text@
