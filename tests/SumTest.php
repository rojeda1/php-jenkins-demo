<?php
declare(strict_types=1);

use PHPUnit\Framework\TestCase;

final class SumTest extends TestCase {
    public function testAdd(): void {
        $this->assertSame(5, Sum::add(2, 3));
    }
}
