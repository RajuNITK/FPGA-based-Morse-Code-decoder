module data_decoder(
input rst,
input send_data,
input [3:0] count,
input [3:0] data_out,
output reg [4:0] out_morse,
output reg count_reset_sig
    );
    
    parameter A_m = 0;
    parameter B_m = 1;
    parameter C_m = 2;
    parameter D_m = 3;
    parameter E_m = 4;
    parameter F_m = 5;
    parameter G_m = 6;
    parameter H_m = 7;
    parameter I_m = 8;
    parameter J_m = 9;
    parameter K_m = 10;
    parameter L_m = 11;
    parameter M_m = 12;
    parameter N_m = 13;
    parameter O_m = 14;
    parameter P_m = 15;
    parameter Q_m = 16;
    parameter R_m = 17;
    parameter S_m = 18;
    parameter T_m = 19;
    parameter U_m = 20;
    parameter V_m = 21;
    parameter W_m = 22;
    parameter X_m = 23;
    parameter Y_m = 24;
    parameter Z_m = 25;
    parameter SPACE_m = 26;

    always@(*)
    begin
        if(!rst)
            begin
                out_morse = 5'b00000;
                count_reset_sig = 1'b0;
            end
        else
            begin
            if(send_data)
                begin
                case(count)
                    1: begin
                        case(data_out[0])
                            0 : out_morse = E_m;
                            1 : out_morse = T_m;
                        endcase
                       end
                    2: begin
                        case(data_out[1:0])
                            0 : out_morse = I_m;
                            1 : out_morse = A_m;
                            2 : out_morse = N_m;
                            3 : out_morse = M_m;       
                        endcase
                       end
                    3:  begin
                            case(data_out[2:0])
                                0 : out_morse = S_m;
                                1 : out_morse = U_m;
                                2 : out_morse = R_m;
                                3 : out_morse = W_m;
                                4 : out_morse = D_m;
                                5 : out_morse = K_m;
                                6 : out_morse = G_m;
                                7 : out_morse = O_m;
                            endcase
                        end
                    4:  begin
                            case(data_out[3:0])
                                0 : out_morse = H_m;
                                1 : out_morse = V_m;
                                2 : out_morse = F_m;
                                4 : out_morse = L_m;
                                6 : out_morse = P_m;
                                7 : out_morse = J_m;
                                8 : out_morse = B_m;
                                9 : out_morse = X_m;
                                10 : out_morse = C_m;
                                11 : out_morse = Y_m;
                                12 : out_morse = Z_m;
                                13 : out_morse = Q_m;
                                15 : out_morse = SPACE_m;
                            endcase
                        end
                     default: out_morse = 27;
                endcase
                count_reset_sig = 1'b1;
                end
            else
                begin
                    count_reset_sig = 1'b0;
                end
            end
    end
    
endmodule

