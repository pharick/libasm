NAME		= libasm.a

CC			= nasm
AR			= ar rc
RM			= rm -f

_SRCS		= ft_strlen.s ft_strcpy.s ft_strcmp.s \
			  ft_write.s ft_read.s ft_strdup.s

_SRCS_BNS	= ft_strchr.s ft_isspace.s ft_atoi_base.s \
			  ft_list_push_front.s ft_list_size.s \
			  ft_list_sort.s ft_list_remove_if.s

SRCS		= $(addprefix srcs/, $(_SRCS))
SRCS_BNS	= $(addprefix srcs/, $(_SRCS_BNS))

OBJS		= $(SRCS:.s=.o)
OBJS_BNS	= $(SRCS_BNS:.s=.o)

CFLAGS		= -f macho64

%.o: %.s
			$(CC) $(CFLAGS) $<

$(NAME):	$(OBJS)
			$(AR) $(NAME) $(OBJS)

bonus:		$(NAME) $(OBJS_BNS)
			$(AR) $(NAME) $(OBJS_BNS)

test:		$(NAME)
			clang -L. -lasm main.c -o main
			./main

test_bonus:	bonus
			clang -L. -lasm main_bonus.c -o main_bonus
			./main_bonus

clean:
			$(RM) $(OBJS) $(OBJS_BNS)

fclean:		clean
			$(RM) $(NAME)

re:			fclean all

all:		$(NAME)

.PHONY: clean fclean re all
