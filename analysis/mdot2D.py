import numpy as np
exec(open('/scratch/qkt4685/harmpi3D/harm_script.py').read())

def mdot2D(total_dumps):
    mdot_sum = open('/scratch/qkt4685/harmpi3D/mdot_sum.csv', 'a')
    v_radial_csv = open('/scratch/qkt4685/harmpi3D/v_radial_csv.csv', 'a')
    
    rd('dump000')
    radius = r[:, 0, 0]
    mdot_sum.write(','.join(map(str, radius)) + '\n')
    v_radial_csv.write(','.join(map(str, radius)) + '\n')
    
    for i in range(total_dumps + 1):
        if i < 1000:
            dump_number = '{:03}'.format(i)
        else:
            dump_number = '{:04}'.format(i)
        
        print(dump_number)
        rd('dump' + dump_number)
        
        uu_radial = uu[1, :, :, :]
        mdotD = (-gdet * rho * uu_radial * _dx2 * _dx3).sum(2).sum(1)
        mdot_sum.write(','.join(map(str, mdotD)) + '\n')
        
        num = (gdet * rho * (uu_radial / uu[0, :, :, :]) * _dx1 * _dx2 * _dx3).sum(2).sum(1)
        den = (gdet * rho * _dx1 * _dx2 * _dx3).sum(2).sum(1)
        avgur = num / den
        v_radial_csv.write(','.join(map(str, avgur)) + '\n')

    v_radial_csv.close()
    mdot_sum.close()

mdot2D(2000)

