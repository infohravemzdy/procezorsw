//
// Created by Ladislav Lisy on 05.11.2021.
//

import Foundation

struct ExampleResultConst {
    static let VALUE_ZERO: Int32 = 0
    static let BASIS_ZERO: Int32 = 0
    static let DESCRIPTION_EMPTY: String = "result from input value"
}

class TimeshtWorkingResult : ExampleTermResult {
    init (target: ITermTarget, value: Int32, basis: Int32, descr: String) {
        super.init(_target: target, _value: value, _basis: basis, _descr: descr)
    }

    convenience init (target: ITermTarget) {
        self.init(target: target,
                value: ExampleResultConst.VALUE_ZERO,
                basis: ExampleResultConst.BASIS_ZERO,
                descr: ExampleResultConst.DESCRIPTION_EMPTY)
    }
}

class AmountBasisResult : ExampleTermResult {
    init (target: ITermTarget, value: Int32, basis: Int32, descr: String) {
        super.init(_target: target, _value: value, _basis: basis, _descr: descr)
    }

    convenience init (target: ITermTarget) {
        self.init(target: target,
                value: ExampleResultConst.VALUE_ZERO,
                basis: ExampleResultConst.BASIS_ZERO,
                descr: ExampleResultConst.DESCRIPTION_EMPTY)
    }
}

class AmountFixedResult : ExampleTermResult {
    init (target: ITermTarget, value: Int32, basis: Int32, descr: String) {
        super.init(_target: target, _value: value, _basis: basis, _descr: descr)
    }

    convenience init (target: ITermTarget) {
        self.init(target: target,
                value: ExampleResultConst.VALUE_ZERO,
                basis: ExampleResultConst.BASIS_ZERO,
                descr: ExampleResultConst.DESCRIPTION_EMPTY)
    }
}

class HealthInsbaseResult : ExampleTermResult {
    init (target: ITermTarget, value: Int32, basis: Int32, descr: String) {
        super.init(_target: target, _value: value, _basis: basis, _descr: descr)
    }

    convenience init (target: ITermTarget) {
        self.init(target: target,
                value: ExampleResultConst.VALUE_ZERO,
                basis: ExampleResultConst.BASIS_ZERO,
                descr: ExampleResultConst.DESCRIPTION_EMPTY)
    }
}

class SocialInsbaseResult : ExampleTermResult {
    init (target: ITermTarget, value: Int32, basis: Int32, descr: String) {
        super.init(_target: target, _value: value, _basis: basis, _descr: descr)
    }

    convenience init (target: ITermTarget) {
        self.init(target: target,
                value: ExampleResultConst.VALUE_ZERO,
                basis: ExampleResultConst.BASIS_ZERO,
                descr: ExampleResultConst.DESCRIPTION_EMPTY)
    }
}

class HealthInspaymResult : ExampleTermResult {
    init (target: ITermTarget, value: Int32, basis: Int32, descr: String) {
        super.init(_target: target, _value: value, _basis: basis, _descr: descr)
    }

    convenience init (target: ITermTarget) {
        self.init(target: target,
                value: ExampleResultConst.VALUE_ZERO,
                basis: ExampleResultConst.BASIS_ZERO,
                descr: ExampleResultConst.DESCRIPTION_EMPTY)
    }
}

class SocialInspaymResult : ExampleTermResult {
    init (target: ITermTarget, value: Int32, basis: Int32, descr: String) {
        super.init(_target: target, _value: value, _basis: basis, _descr: descr)
    }

    convenience init (target: ITermTarget) {
        self.init(target: target,
                value: ExampleResultConst.VALUE_ZERO,
                basis: ExampleResultConst.BASIS_ZERO,
                descr: ExampleResultConst.DESCRIPTION_EMPTY)
    }
}

class TaxingAdvbaseResult : ExampleTermResult {
    init (target: ITermTarget, value: Int32, basis: Int32, descr: String) {
        super.init(_target: target, _value: value, _basis: basis, _descr: descr)
    }

    convenience init (target: ITermTarget) {
        self.init(target: target,
                value: ExampleResultConst.VALUE_ZERO,
                basis: ExampleResultConst.BASIS_ZERO,
                descr: ExampleResultConst.DESCRIPTION_EMPTY)
    }
}

class TaxingAdvpaymResult : ExampleTermResult {
    init (target: ITermTarget, value: Int32, basis: Int32, descr: String) {
        super.init(_target: target, _value: value, _basis: basis, _descr: descr)
    }

    convenience init (target: ITermTarget) {
        self.init(target: target,
                value: ExampleResultConst.VALUE_ZERO,
                basis: ExampleResultConst.BASIS_ZERO,
                descr: ExampleResultConst.DESCRIPTION_EMPTY)
    }
}

class IncomeGrossResult : ExampleTermResult {
    init (target: ITermTarget, value: Int32, basis: Int32, descr: String) {
        super.init(_target: target, _value: value, _basis: basis, _descr: descr)
    }

    convenience init (target: ITermTarget) {
        self.init(target: target,
                value: ExampleResultConst.VALUE_ZERO,
                basis: ExampleResultConst.BASIS_ZERO,
                descr: ExampleResultConst.DESCRIPTION_EMPTY)
    }
}

class IncomeNettoResult : ExampleTermResult {
    init (target: ITermTarget, value: Int32, basis: Int32, descr: String) {
        super.init(_target: target, _value: value, _basis: basis, _descr: descr)
    }

    convenience init (target: ITermTarget) {
        self.init(target: target,
                value: ExampleResultConst.VALUE_ZERO,
                basis: ExampleResultConst.BASIS_ZERO,
                descr: ExampleResultConst.DESCRIPTION_EMPTY)
    }
}


