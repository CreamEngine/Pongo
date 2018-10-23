/*
 * Copyright (c) 2018 Jeremy Meltingtallow
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

package pongo.ecs.group;

@:allow(pongo)
class SwapEntityList
{
    private function new() : Void
    {
        _lists = [new EntityList(), new EntityList()];
    }

    public function addToQueue(entity :Entity) : Bool
    {
        return this.queued().add(entity);
    }

    public inline function active() : EntityList
    {
        return _lists[0];
    }

    public inline function queued() : EntityList
    {
        return _lists[1];
    }

    public inline function swap() : Void
    {
        var temp = _lists[0];
        _lists[0] = _lists[1];
        _lists[1] = temp;
    }

    public inline function clearActive() : Void
    {
        this.active().clear();
    }

    private var _lists :Array<EntityList>;
}