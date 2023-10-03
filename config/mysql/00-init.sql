use everydaytasks;

create table categories (
	id varchar(32),
	title varchar(64) not null,
	color int not null,

	primary key (id)
);


create table users (
   name varchar(64),
   password varchar(128) not null,

   primary key (name)
);

create table activities (
    id varchar(32),
    subject text not null,
    description text,
    date_time datetime not null,
    category varchar(32),
    username varchar(64),

    primary key (id),
    foreign key (category) references categories(id),
    foreign key (username) references users(name)
);

create table tasks (
    id varchar(32),
    subject text not null,
    description text,
    due datetime,
    category varchar(32),
    activity varchar(32),
    username varchar(64),

    primary key (id),
    foreign key (category) references categories(id),
    foreign key (activity) references activities(id),
    foreign key (username) references users(name)
);

create table projects (
    id varchar(32),
    category varchar(32),
    subject text not null,
    description text,
    due datetime,

    primary key (id),
    foreign key (category) references categories(id)
);

-- Relation table between projects and tasks
create table subprojects (
    project varchar(32),
    task varchar(32),
    card_order float(24),

    foreign key (project) references projects(id),
    foreign key (task) references tasks(id)
);
