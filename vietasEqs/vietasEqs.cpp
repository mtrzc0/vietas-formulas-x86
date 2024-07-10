#include <iostream>

extern "C" int vietasEqs(int a, int b, int c, int *x1x2, int *x1_plus_x2);

int main()
{
    std::cout << "Vieta formulas in x86 Assembly!\n";

    int x1x2 = 0, x1_plus_x2 = 0;

    // it only works with integer quotient
    int ret = vietasEqs(10, 12, 2, &x1x2, &x1_plus_x2);

    std::cout << "ret = " << ret << std::endl;
    std::cout << "x1x2 = " << x1x2 << std::endl;
    std::cout << "x1_plus_x2 = " << x1_plus_x2 << std::endl;
}
