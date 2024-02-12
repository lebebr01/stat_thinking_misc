library(readr)
#
# lib_data <- read_fwf(file = "/Users/bleb/Downloads/DTA140.file0011.PUBLIB90.FULLDATA",
#                     fwf_widths(c(2, 4, 2, 4, 20, 45, 35, 17, 5, 4, 10, 11, 5, 5, 5, 5,
#                                  11, 11, 12, 12, 11, 11, 11, 11, 12, 11, 11, 11, 11, 11, 11, 11,
#                                  11, 11, 11, 11, 11, 10, 11, 11, 11, 8, 8),
#                     c("post_code", "seq_key", "fips", "pub_seq", "lib_code", "name",
#                       "addr", "city", "zip", "zip4", "phone", "service_pop", "num_main",
#                       "num_branch", "num_bookmobile", "num_other", "fte_lib_ms", "fte_lib",
#                       "fte_other", "fte_tot", "inc_local", "inc_state", "inc_fed", "inc_other",
#                       "inc_total", "opx_sal", "opx_ben", "opx_tot_st", "opx_tot_cl", "opx_oth",
#                       "opx_total", "cap_outlay", 'col_books', 'col_audio', 'col_film', 'col_video',
#                       'col_c_serial', 'pshours', 'attendance', 'reference_trans', 'circulation',
#                       'ill_out', 'ill_in')))
#
#
# lib_data_e <- read_fwf(file = "/Users/bleb/Downloads/DTA140.file0011.PUBLIB90.FULLDATA",
#                        fwf_empty("/Users/bleb/Downloads/DTA140.file0011.PUBLIB90.FULLDATA",
#                                  col_names = c("post_code", "seq_key", "fips", "pub_seq", "lib_code", "name",
#                                                "addr", "city", "zip", "zip4", "phone", "service_pop", "num_main",
#                                                "num_branch", "num_bookmobile", "num_other", "fte_lib_ms", "fte_lib",
#                                                "fte_other", "fte_tot", "inc_local", "inc_state", "inc_fed", "inc_other",
#                                                "inc_total", "opx_sal", "opx_ben", "opx_tot_st", "opx_tot_cl", "opx_oth",
#                                                "opx_total", "cap_outlay", 'col_books', 'col_audio', 'col_film', 'col_video',
#                                                'col_c_serial', 'pshours', 'attendance', 'reference_trans', 'circulation',
#                                                'ill_out', 'ill_in')))


lib_data_p <- read_fwf(file = "/Users/bleb/Downloads/DTA140.file0011.PUBLIB90.FULLDATA",
                       fwf_positions(start = c(1, 3, 7, 9, 13, 33, 78, 113, 130, 135, 139,
                                               149, 160, 165, 170, 175, 180, 191, 202, 214, 226, 237,
                                               248, 259, 270, 282, 293, 304, 315, 326, 337, 349,
                                               360, 371, 382, 393, 404, 415, 425, 436, 447,
                                               458, 466),
                                     end = c(2, 6, 8, 12, 32, 77, 112, 129, 134, 138, 148, 159, 164, 169, 174, 179, 190,
                                             201, 213, 225, 236, 247, 258, 269, 281, 292, 303, 314, 325, 336, 348, 359,
                                             370, 381, 392, 403, 414, 424, 435, 446, 457, 465, 473),
                                  c("post_code", "seq_key", "fips", "pub_seq", "lib_code", "name",
                                    "addr", "city", "zip", "zip4", "phone", "service_pop", "num_main",
                                    "num_branch", "num_bookmobile", "num_other", "fte_lib_ms", "fte_lib",
                                    "fte_other", "fte_tot", "inc_local", "inc_state", "inc_fed", "inc_other",
                                    "inc_total", "opx_sal", "opx_ben", "opx_tot_st", "opx_tot_cl", "opx_oth",
                                    "opx_total", "cap_outlay", 'col_books', 'col_audio', 'col_film', 'col_video',
                                    'col_c_serial', 'pshours', 'attendance', 'reference_trans', 'circulation',
                                    'ill_out', 'ill_in')),
                       na = '-1')
write_csv(lib_data_p, file = "data-raw/library-data.csv")
lib_data <- lib_data_p
save(lib_data, file = 'Data/library-data.rda')
